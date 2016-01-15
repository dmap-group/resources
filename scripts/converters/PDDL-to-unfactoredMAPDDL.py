#!/usr/bin/python2.7

import sys
import os
from sets import Set

DFILE_KEYWORDS = ["requirements", "types", "predicates", "action","functions","constants"]
DFILE_REQ_KEYWORDS = ["typing","strips","action-costs"]
DFILE_SUBKEYWORDS = ["parameters", "precondition", "effect", "duration"]
PFILE_KEYWORDS = ["objects", "init", "goal","metric"]
AFILE_KEYWORDS = ["agents"]
PUBLIC = "public"

class Predicate(object):
  """A loose interpretation of a predicate used for all similar collections.

  Without a name it is a parameter list.
  It can be typed (or not).
    If typed then args = [[var, type], ...]
    Else args = [var, ...]
  It can be negated.
  It may contain variables or objects in its arguments.
  """
  def __init__(self, name, args, is_typed, is_negated):
    self.name = name
    self.args = args
    self.arity = len(args)
    self.is_typed = is_typed
    self.is_negated = is_negated
    self.ground_facts = set()
    self.agent_param = -1

  def pddl_rep(self):
    """Returns the PDDL version of the instance."""
    rep = ''
    if self.is_negated:
      rep += "(not "
    if self.name != "":
      rep += "(" + self.name + " "
    else:
      rep += "("
    for argument in self.args:
      if self.is_typed:
        rep += argument[0] + " - " + argument[1] + " "
      else:
        rep += argument + " "
    rep = rep[:-1]
    rep += ")"
    if self.is_negated:
      rep += ")"
    return rep

  def pddl_rep_sub(self,from_index):
    """Returns the PDDL version of the instance."""
    rep = ''
    if self.is_negated:
      rep += "(not "
    if self.name != "":
      rep += "(" + self.name + " "
    else:
      rep += "("
    for argument in self.args[from_index:]:
      if self.is_typed:
        rep += argument[0] + " - " + argument[1] + " "
      else:
        rep += argument + " "
    rep = rep[:-1]
    rep += ")"
    if self.is_negated:
      rep += ")"
    return rep

  def ground(self, objects, agent,problem):
    name = self.name
    object_set = []
    #print self.name + ": " + str(self.args) + str(objects)
    for argument in self.args:
      if self.is_typed:
        name = name + "-" + objects[argument[0]]
        object_set.append(objects[argument[0]])
      else:
        if argument.startswith('?'):
          name = name + "-" + objects[argument]
          object_set.append(objects[argument])
        else:
          #a constant
          name = name + "-" + argument
          object_set.append(argument)
    #print " " + self.name + ": " + str(object_set)
    gf = GroundFact(problem,name,problem.predicate_map[self.name],agent,object_set)
    problem.predicate_map[self.name].ground_facts.add(gf)
    return gf

  def ground_self(self,problem):
    name = self.name
    object_set = []
    for argument in self.args:
      name = name + "-" + argument
      object_set.append(argument)
    gf = GroundFact(problem,name,self,PUBLIC,object_set)
    self.ground_facts.add(gf)
    return gf

  def replace_agent_param(self):
    #print self
    #print self.args
    if self.agent_param != -1:
      if self.is_typed:
        #print self.args[self.agent_param][0]
        #self.args[self.agent_param][0] = '?agent'
        self.args[self.agent_param] = '?agent', self.args[self.agent_param][1]
      else:
        self.args[self.agent_param] = '?agent'
    

  def __repr__(self):
    return self.pddl_rep()

class GroundFact(object):
  def __init__(self,problem, name, predicate, agent, objects):
    self.name = name
    self.predicate = predicate
    self.agent = agent
    self.objects = objects #list
    self.agent_argument_index = -1

    problem.agent_facts[agent].add(self)

    for i in range(len(objects)):
      if self.objects[i] == self.agent:
        self.agent_argument_index = i
        break

  def __eq__(self, other):
    if isinstance(other, self.__class__):
      return self.__hash__() == other.__hash__()
    else:
      return False

  def __ne__(self, other):
    return not self.__eq__(other)

  def __hash__(self):
    return self.name.__hash__()
  
  def __repr__(self):
    return "\n" + self.name + "(" + self.agent +":"+str(self.agent_argument_index)+ ")"


class Action(object):
  """Represents a simple non-temporal action."""
  def __init__(self, name, parameters, precondition, effect):
    self.name = name
    self.parameters = parameters
    self.precondition = precondition
    self.effect = effect
    self.duration = 1
    self.agent_param = parameters.args[0][0]
    self.agent_type = parameters.args[0][1]
    self.ground_actions = {GroundAction(name,self,PUBLIC,{})}

  def pddl_rep(self):
    """Returns the PDDL version of the instance."""
    rep = ''
    rep += "(:action " + self.name + "\n"
    rep += "\t:parameters " + str(self.parameters) + "\n"
    if len(self.precondition) > 1:
      rep += "\t:precondition (and\n"
    else:
      rep += "\t:precondition \n"
    for precon in self.precondition:
      rep += "\t\t" + str(precon) + "\n"
    if len(self.precondition) > 1:
      rep += "\t)\n"
    if len(self.effect) > 1:
      rep += "\t:effect (and\n"
    else:
      rep += "\t:effect \n"
    for eff in self.effect:
      rep += "\t\t" + str(eff) + "\n"
    if len(self.effect) > 1:
      rep += "\t)\n"
    rep += ")\n"
    return rep

  def ma_pddl_rep(self):
    """Returns the MA-PDDL version of the instance."""
    rep = ''
    rep += "(:action " + self.name + "\n"
    rep += "\t:agent " + str(self.agent_param) + " - " + str(self.agent_type) + "\n"
    rep += "\t:parameters " + str(self.parameters.pddl_rep_sub(1)) + "\n"
    if len(self.precondition) > 1:
      rep += "\t:precondition (and\n"
    else:
      rep += "\t:precondition \n"
    for precon in self.precondition:
      rep += "\t\t" + str(precon) + "\n"
    if len(self.precondition) > 1:
      rep += "\t)\n"
    if len(self.effect) > 1:
      rep += "\t:effect (and\n"
    else:
      rep += "\t:effect \n"
    for eff in self.effect:
      rep += "\t\t" + str(eff) + "\n"
    if len(self.effect) > 1:
      rep += "\t)\n"
    rep += ")\n"
    return rep

  def ground(self, problem):
    print self.name + ": " + str(self.parameters)
    for param in self.parameters.args:
      new_ground_actions = set()
      for action in self.ground_actions:
        if self.parameters.is_typed:
          #print "use objects... " + str(problem.get_objects_of_type(param[1]))
          for obj in problem.get_objects_of_type(param[1]):
            new_objects = { k : v for k, v in action.objects.iteritems() }
            new_objects[param[0]] = obj
            if param[0] == self.agent_param:
              new_ground_actions.add(GroundAction(action.name + "-" + obj,self,obj,new_objects))
            else:
              new_ground_actions.add(GroundAction(action.name + "-" + obj,self,action.agent,new_objects))
        else:
          for obj in problem.get_objects_of_type('object'):
            new_objects = { k : v for k, v in action.objects.iteritems() }
            new_objects[param] = obj
            if param == self.agent_param:
              new_ground_actions.add(GroundAction(action.name + "-" + obj,self,obj,new_objects))
            else:
              new_ground_actions.add(GroundAction(action.name + "-" + obj,self,action.agent,new_objects))
      self.ground_actions = new_ground_actions
    problem.ground_actions = problem.ground_actions | self.ground_actions

    for ground_action in self.ground_actions:
      for pre in self.precondition:
        ground_action.pre.add(pre.ground(ground_action.objects,action.agent, problem))
      for eff in self.effect:
        if eff.name == "increase":
          #print "increase!" + str(eff)
          pass
        elif eff.is_negated:
          ground_action.edel.add(eff.ground(ground_action.objects,action.agent, problem))
        else:
          ground_action.eadd.add(eff.ground(ground_action.objects,action.agent, problem))
      problem.ground_facts = problem.ground_facts | ground_action.pre | ground_action.edel | ground_action.eadd

    
      

  def __repr__(self):
    return self.name #+ str(self.parameters)

class GroundAction(object):
  def __init__(self, name, action, agent,objects):
    self.name = name
    self.action = action
    self.agent = agent
    self.public = False
    self.objects = objects
    self.pre = set()
    self.eadd = set()
    self.edel = set()
    self.facts = set()

  def get_facts(self):
    if len(self.facts) == 0:
      self.facts = self.pre | self.eadd | self.edel
    return self.facts
  
  def __repr__(self):
    #return self.name #+ str(self.objects)
    return "\n[" + self.name + "(" + self.agent + ")" #+",pre:"+ str(self.pre)+",add:"+ str(self.eadd)+",del:"+ str(self.edel)+"]"


class Agent(object):
  def __init__(self, name):
    self.name = name
    self.ground_actions = set()
    self.ground_facts = set()
    self.objects = set()
    self.private_objects = set()

  def __repr__(self):
    return "\n"+self.name + ": actions:" + str(len(self.ground_actions) ) + ",facts:" + str(len(self.ground_facts) ) + ",\n   public objects:" + str(self.objects ) + ",\n   private objects:" + str(self.private_objects )

class Function(object):
  def __init__(self, obj_list):
    self.obj_list = obj_list

  def pddl_rep(self):
    """Returns the PDDL version of the instance."""
    rep = '('
    for argument in self.obj_list:
      rep += argument + " "
    rep = rep[:-1]
    rep += ") - number"
    return rep

  def __repr__(self):
    return self.pddl_rep()

class GroundFunction(object):
  def __init__(self, obj_list):
    self.obj_list = obj_list

  def pddl_rep(self):
    """Returns the PDDL version of the instance."""
    rep = '(' + self.obj_list[0] + " ("
    for argument in self.obj_list[1:-1]:
      rep += argument + " "
    rep = rep[:-1]
    rep += ") " + self.obj_list[-1] + ") "
    return rep

  def __repr__(self):
    return self.pddl_rep()



class PlanningProblem(object):
  """A complete planning problem."""
  def __init__(self, domainfile, problemfile,agentfile):
    #From domainfile
    self.domain = '' #String
    self.requirements = [] #[String]
    self.type_list = Set() #{String}
    self.type_list.add('object')
    self.types = {} #Key = supertype_name, Value = type
    self.predicates = [] #[Predicate]
    self.functions = []
    self.ground_functions = []
    self.predicate_map = {} #key = name, value = Predicate
    self.agent_predicates = {} #key = agent/public, value = Predicate
    self.agent_facts = {} #key = agent/public, value = Fact
    self.actions = [] #[Action]
    #From problemfile
    self.problem = '' #String
    self.object_list = Set() #{String}
    self.agent_list = [] #{String}
    self.agents = {}
    self.objects = {} #Key = type, Value = object_name
    self.constants = {} #Key = type, Value = object_name
    self.init = [] #List of Predicates
    self.goal = [] #List of Predicates
    self.goal_reachable = False
    self.metric = False
    
    self.ground_init = [] #List of Ground Predicates
    self.ground_goal = [] #List of Ground Predicates

    self.ground_facts = set()
    self.public_facts = set()
    self.private_facts = set()
    self.ground_actions = set()

    self.reachable_facts = set()
    self.reachable_actions = set()

    self.parse_domain(domainfile)
    self.parse_problem(problemfile)
    self.parse_agents(agentfile)

    for p in self.predicates:
      self.predicate_map[p.name] = p

    for ag in self.agent_list:
      self.agents[ag] = Agent(ag)
      self.agent_predicates[self.get_type_of_object(ag)] = set()
      self.agent_facts[ag] = set()

    self.agent_predicates[PUBLIC] = set()
    self.agent_facts[PUBLIC] = set()

    #print "actions:\n" + str(self.actions)

    for action in self.actions:
      action.ground(self)

    #print "ground actions:\n" + str(self.ground_actions)

    #self.print_problem()

    for predicate in self.init:
      gp = predicate.ground_self(self)
      if gp in self.ground_facts:
        gp =  filter(lambda f: f==gp,self.ground_facts)[0]
        #print gp
      self.ground_init.append(gp)

    for predicate in self.goal:
      self.ground_goal.append(predicate.ground_self(self))

    self.reachability()

    #print str(self.reachable_actions)

    for a in self.reachable_actions:
      self.agents[a.agent].ground_actions.add(a)
      self.agents[a.agent].ground_facts = self.agents[a.agent].ground_facts | a.get_facts()

    print self.agents
    
    self.find_public_facts()
    self.private_facts = self.reachable_facts.copy() - self.public_facts

    #print "ground goal: \n" + str(self.ground_goal)

    private_goals = set(filter(lambda f: f in self.ground_goal,self.private_facts))
    #print "private goals: \n" + str(private_goals)
    for f in private_goals:
      f.agent = PUBLIC


    self.private_facts = self.private_facts - private_goals
    self.public_facts = self.public_facts - private_goals
    self.public_facts = self.public_facts | private_goals

    #print "public_facts: \n" + str(self.public_facts)

    self.infer_private_predicates()
    self.infer_private_objects()

    

  def get_objects_of_type(self,of_type):
    #print "get objects of type " + of_type
    selected_types = {of_type}
    pre_size = 0
    while len(selected_types) > pre_size:
      pre_size = len(selected_types)
      for t in selected_types:
        if t in self.types:
          selected_types = selected_types | set(self.types[t])
    #print selected_types
    selected_objects = set()
    for t in selected_types:
      if t in self.objects:
        selected_objects = selected_objects | set(self.objects[t])
      if t in self.constants:
        selected_objects = selected_objects | set(self.constants[t])
    return selected_objects

  def get_type_of_object(self,obj):
    for t in self.objects.iterkeys():
      if obj in self.objects[t]:
        return t
    for t in self.constants.iterkeys():
      if obj in self.constants[t]:
        return t

  def get_supertypes_of_type(self,of_type):
    selected_types = {of_type}
    pre_size = 0
    for t in self.types.iterkeys():
      if of_type in set(self.types[t]):
        selected_types = selected_types | self.get_supertypes_of_type(t)
    #print "supertypes of " + of_type + ": " + str(selected_types)
    return selected_types
    

  def reachability(self):
    self.reachable_facts = set(self.ground_init)
    unreached_goals = set(self.ground_goal) - self.reachable_facts
    #print "\nUNREACHED: " + str(unreached_goals)
    unreached_actions = self.ground_actions.copy() 
    #print "\nUNREACHED ACTIONS: " + str(unreached_actions)
    num_of_unreached_actions = len(unreached_actions)+1
    while num_of_unreached_actions > len(unreached_actions):
      #print "\nREACHED: " + str(self.reachable_facts)
      num_of_unreached_actions = len(unreached_actions)
      for a in unreached_actions:
        #print "\n...CHECK: " + str(a.pre) +  ": " + str(a.pre <= self.reachable_facts)
        #print "\n...CHECK: " + str(a.pre) + " subset of " + str(self.reachable_facts) + ": " + str(a.pre <= self.reachable_facts)
        if a.pre <= self.reachable_facts:
          #print "\n...APPLY: " + str(a)
          #print "\n...REACH: " + str(a.eadd)
          self.reachable_facts = self.reachable_facts | a.eadd
          self.reachable_actions.add(a)
          unreached_goals = unreached_goals - a.eadd
          unreached_actions = unreached_actions - {a}
      #print "\nUNREACHED: " + str(unreached_goals)
    if len(unreached_goals) == 0:
      self.goal_reachable = True
      print "GOAL REACHED!"
      print "REACHED " + str(len(self.reachable_facts)) + " FACTS"
    else:
      print "WARNING: GOAL NOT REACHABLE!"


  def find_public_facts(self):
    for ag1 in self.agents.itervalues():
      for ag2 in self.agents.itervalues():
        if ag1.name != ag2.name:
          for a1 in ag1.ground_actions:
            #print "a1: " + str(a1)
            for a2 in ag2.ground_actions:
              #print "a2: " + str(a1)
              common = a1.get_facts() & a2.get_facts()
              if len(common) > 0:
                #print "common: " + str(common)
                a1.public = True
                a2.public = True
              for f in common:
                f.agent = PUBLIC
                self.public_facts.add(f)
              

  def infer_private_predicates(self):
    for p in self.predicates:
      public = False
      agents = set()
      
      #print p
      for f in p.ground_facts:
        #print "   " + str(f)
        if f in self.ground_goal:  
          public = True
        elif f.agent == PUBLIC:
          public = True
        else:
          #agents.add(f.agent)
          if f.agent_argument_index != -1:
            p.agent_param = f.agent_argument_index
        for a in self.agent_list:
          if f in self.agent_facts[a]:
            agents.add(a)
      #print str(agents) + " (public=" + str(public) + ")"
      agent_types = set()
      for a in agents:
        t = self.get_type_of_object(a) 
        #print "  type of " + a + " is " + t
        agent_types.add(t)
      #print "types: " + str(agent_types)
      if public == False and len(self.agent_predicates) > 2 and  len(agent_types)+1 == len(self.agent_predicates):
        public = True
        print p
        print "Predicate was made public because it is used by all agents!"
      if public:
        self.agent_predicates[PUBLIC].add(p)
      else:
        p.replace_agent_param()
        for a in agent_types:
          self.agent_predicates[a].add(p)

  def infer_private_objects(self):
    for ag in self.agent_list:
      for f in self.agents[ag].ground_facts:
        self.agents[ag].objects = self.agents[ag].objects | set(f.objects)
    public_obj = set() 
    for f in self.ground_goal:
      public_obj = public_obj | set(f.objects)
    for f in self.ground_init:
      print f
      #agents = set()
      for ag in self.agent_list:
        if f in self.agent_facts[ag]:
          self.agents[ag].objects = self.agents[ag].objects | set(f.objects)
          #agents.add(agent)
      #print "agents: " + str(agents)
      #print "relevant predicate: " + str(f.predicate)
      #for agent in self.agent_predicates.iterkeys():
      #  if f.predicate in self.agent_predicates[agent]:
      #    print "agent: " + agent
    for ag1 in self.agent_list:
      for ag2 in self.agent_list:
        if ag1 != ag2:
          shared_obj = set(filter(lambda o: o in self.agents[ag1].objects,self.agents[ag2].objects))
          #print ag1 + " objects: " + str(self.agents[ag1].objects)
          #print ag2 + " objects: " + str(self.agents[ag2].objects)
          #print "shared objects: " + str(shared_obj)
          public_obj = public_obj | shared_obj
    for ag in self.agent_list:
      self.agents[ag].private_objects = self.agents[ag].objects - public_obj
      self.agents[ag].objects = public_obj.copy()
        
    
    

  def print_problem(self):
    """Prints out the planning problem in (semi-)readable format."""
    print '\n*****************'
    print 'DOMAIN: ' + self.domain
    print 'PROBLEM: ' + self.problem
    print 'REQUIREMENTS: ' + str(self.requirements)
    print 'TYPES: ' + str(self.types)
    print 'PREDICATES: ' + str(self.predicates)
    print 'ACTIONS: ' + str(self.actions)
    print 'OBJECTS: ' + str(self.objects)
    print 'INIT: ' + str(self.init)
    print 'GOAL: ' + str(self.goal)
    print 'AGENTS: ' + str(self.agent_list)
    print 'FACTS: ' + str(len(self.ground_facts))
    print 'GROUND ACTIONS: ' + str(len(self.ground_actions))
    print 'GROUND INIT: ' + str(len(self.ground_init))
    print 'GROUND GOAL: ' + str(len(self.ground_goal))
    print 'REACHABLE FACTS: ' + str(len(self.reachable_facts))
    print 'REACHABLE ACTIONS: ' + str(len(self.reachable_actions))
    print 'AGENTS: ' + str(self.agents)
    print 'PRIVATE FACTS('+str(len(self.private_facts))+'): '# + str(self.private_facts)
    print 'PUBLIC FACTS('+str(len(self.public_facts))+'): ' #+ str(self.public_facts)
    print '****************'

    #for a in self.actions:
    #  print a.ma_pddl_rep()

    #for p in self.predicates:
    #   print p.name + ": " + str(p.ground_facts)

    for a in self.agent_predicates.iterkeys():
      print str(a) + ":"
      for p in self.agent_predicates[a]:
        print p

  

  def parse_domain(self, domainfile):
    """Parses a PDDL domain file."""
    
    with open(domainfile) as dfile:
      dfile_array = self._get_file_as_array(dfile)
    #Deal with front/end define, problem, :domain
    if dfile_array[0:4] != ['(', 'define', '(', 'domain']:
      print 'PARSING ERROR: Expected (define (domain ... at start of domain file'
      sys.exit()
    self.domain = dfile_array[4]

    dfile_array = dfile_array[6:-1]
    opencounter = 0
    keyword = ''
    obj_list = []
    is_obj_list = True
    for word in dfile_array:
      if word == '(':
        opencounter += 1
      elif word == ')':
        opencounter -= 1
      elif word.startswith(':'):
        if word[1:] not in DFILE_KEYWORDS:
          pass
        elif keyword != 'requirements':
          keyword = word[1:]
      if opencounter == 0:
        if keyword == 'action':
          if obj_list[0] == '-':
            obj_list = obj_list[2:]
          self.actions.append(obj_list)
          obj_list = []
        if keyword == 'types':
          for element in obj_list:
            self.types.setdefault('object', []).append(element)
            self.type_list.add('object')
            self.type_list.add(element)
          obj_list = []
        keyword = ''

      if keyword == 'requirements': #Requirements list
        if word != ':requirements':
          if not word.startswith(':'):
            print 'PARSING ERROR: Expected requirement to start with :'
            sys.exit()
          elif word[1:] not in DFILE_REQ_KEYWORDS:
            print 'PARSING ERROR: Unknown Rquierement ' + word[1:]
            print 'Requirements must only be: ' + str(DFILE_REQ_KEYWORDS)
            sys.exit()
          else:
            self.requirements.append(word[1:])
      elif keyword == 'action':
        obj_list.append(word)
      elif not word.startswith(':'):
        if keyword == 'types': #Typed list of objects
          if is_obj_list:
            if word == '-':
              is_obj_list = False
            else:
              obj_list.append(word)
          else:
            #word is type
            for element in obj_list:
              if not word in self.type_list:
                self.types.setdefault('object', []).append(word)
                self.type_list.add(word)
              self.types.setdefault(word, []).append(element)
              self.type_list.add(element)
              self.type_list.add(word)
            is_obj_list = True
            obj_list = []
        elif keyword == 'constants': #Typed list of objects
          if is_obj_list:
            if word == '-':
              is_obj_list = False
            else:
              obj_list.append(word)
          else:
            #word is type
            for element in obj_list:
              if word in self.type_list:
                self.constants.setdefault(word, []).append(element)
                #self.object_list.add(element)
              else:
                print self.type_list
                print "ERROR unknown type " + word
                sys.exit()
            is_obj_list = True
            obj_list = []
        elif keyword == 'predicates': #Internally typed predicates
          if word == ')':
            p_name = obj_list[0]
            pred_list = self._parse_name_type_pairs(obj_list[1:],
                                                    self.type_list)
            self.predicates.append(Predicate(p_name, pred_list, True, False))
            obj_list = []
          elif word != '(':
            obj_list.append(word)
        elif keyword == 'functions': #functions
          if word == ')':
            p_name = obj_list[0]
            if obj_list[0] == '-':
              obj_list = obj_list[2:]
            print "function: " + word + " - " + str(obj_list)
            self.functions.append(Function(obj_list))
            obj_list = []
          elif word != '(':
            obj_list.append(word)

    #Work on the actions
    new_actions = []
    for action in self.actions:
      act_name = action[1]
      act = {}
      action = action[2:]
      keyword = ''
      for word in action:
        if word.startswith(':'):
          keyword = word[1:]
        else:
          act.setdefault(keyword, []).append(word)
      param_list = self._parse_name_type_pairs(act.get('parameters')[1:-1],
                                               self.type_list)
      up_params = Predicate('', param_list, True, False)
      pre_list = self._parse_unground_propositions(act.get('precondition'))
      eff_list = self._parse_unground_propositions(act.get('effect'))
      new_act = Action(act_name, up_params, pre_list, eff_list)

      new_actions.append(new_act)
    self.actions = new_actions


  def parse_problem(self, problemfile):
    """The main method for parsing a PDDL files."""

    with open(problemfile) as pfile:
      pfile_array = self._get_file_as_array(pfile)
    #Deal with front/end define, problem, :domain
    if pfile_array[0:4] != ['(', 'define', '(', 'problem']:
      print 'PARSING ERROR: Expected (define (problem ... at start of problem file'
      sys.exit()
    self.problem = pfile_array[4]
    if pfile_array[5:8] != [')', '(', ':domain']:
      print 'PARSING ERROR: Expected (:domain ...) after (define (problem ...)'
      sys.exit()
    if self.domain != pfile_array[8]:
      print 'ERROR - names don\'t match between domain and problem file.'
      #sys.exit()
    if pfile_array[9] != ')':
      print 'PARSING ERROR: Expected end of domain declaration'
      sys.exit()
    pfile_array = pfile_array[10:-1]

    opencounter = 0
    keyword = ''
    is_obj_list = True
    is_function = False
    obj_list = []
    int_obj_list = []
    int_opencounter = 0
    for word in pfile_array:
      if word == '(':
        opencounter += 1
      elif word == ')':
        opencounter -= 1
      elif word.startswith(':'):
        if word[1:] not in PFILE_KEYWORDS:
          print 'PARSING ERROR: Unknown keyword: ' + word[1:]
          print 'Known keywords: ' + str(PFILE_KEYWORDS)
        else:
          keyword = word[1:]
      if opencounter == 0:
        keyword = ''

      if not word.startswith(':'):
        if keyword == 'objects': #Typed list of objects
          if is_obj_list:
            if word == '-':
              is_obj_list = False
            else:
              obj_list.append(word)
          else:
            #word is type
            for element in obj_list:
              if word in self.type_list:
                self.objects.setdefault(word, []).append(element)
                self.object_list.add(element)
              else:
                print self.type_list
                print "ERROR unknown type " + word
                sys.exit()
            is_obj_list = True
            obj_list = []
        elif keyword == 'init':
          if word == ')':
            if obj_list[0] == '=' and is_function == False:
              is_function = True
            else:
              if is_function:
                #print "function: " + str(obj_list)
                self.ground_functions.append(GroundFunction(obj_list))
                is_function = False
              else:
                #print "predicate: " + str(obj_list)
                self.init.append(Predicate(obj_list[0], obj_list[1:],False, False))
              obj_list = []
          elif word != '(':
            obj_list.append(word)
        elif keyword == 'goal':
          if word == '(':
            int_opencounter += 1
          elif word == ')':
            int_opencounter -= 1
          obj_list.append(word)
          if int_opencounter == 0:
              self.goal = self._parse_unground_propositions(obj_list)
              obj_list = []
        elif keyword == 'metric':
          self.metric = True
          obj_list = []


  def parse_agents(self, agentfile):
    """The main method for parsing a PDDL files."""

    with open(agentfile) as afile:
      pfile_array = self._get_file_as_array(afile)
    #Deal with front/end define, problem, :domain
    if pfile_array[0:4] != ['(', 'define', '(', 'problem']:
      print 'PARSING ERROR: Expected (define (problem ... at start of problem file'
      sys.exit()
    self.problem = pfile_array[4]
    if pfile_array[5:8] != [')', '(', ':domain']:
      print 'PARSING ERROR: Expected (:domain ...) after (define (problem ...)'
      sys.exit()
    if self.domain != pfile_array[8]:
      print 'ERROR - names don\'t match between domain and agent file.'
      #sys.exit()
    if pfile_array[9] != ')':
      print 'PARSING ERROR: Expected end of domain declaration'
      sys.exit()
    pfile_array = pfile_array[10:-1]

    opencounter = 0
    keyword = ''
    for word in pfile_array:
      if word == '(':
        opencounter += 1
      elif word == ')':
        opencounter -= 1
      elif word.startswith(':'):
        if word[1:] not in AFILE_KEYWORDS:
          print 'PARSING ERROR: Unknown keyword: ' + word[1:]
          print 'Known keywords: ' + str(AFILE_KEYWORDS)
        else:
          keyword = word[1:]

      if opencounter == 0:
        keyword = ''

      if not word.startswith(':'):
        if keyword == 'agents': #list of agents
          self.agent_list.append(word)
 

         
    
  #Get string of file with comments removed - comments are rest of line after ';'
  def _get_file_as_array(self, file_):
    """Returns the file split into array of words.

    Removes comments and separates parenthesis.
    """
    file_as_string = ""
    for line in file_:
      if ";" in line:
        line = line[:line.find(";")]
      line = (line.replace('\t', '').replace('\n', ' ')
          .replace('(', ' ( ').replace(')', ' ) '))
      file_as_string += line
    file_.close()
    return file_as_string.strip().split()

  def _parse_name_type_pairs(self, array, types):
    """Parses array creating paris of form (name, type).

    Expects array such as [?a, -, agent, ...]."""
    pred_list = []
    if len(array)%3 != 0:
      print "Expected predicate to be typed " + str(array)
      sys.exit()
    for i in range(0, len(array)/3):
      if array[3*i+1] != '-':
        print "Expected predicate to be typed"
        sys.exit()
      if array[3*i+2] in types:
        pred_list.append((array[3*i], array[3*i+2]))
      else:
        print "PARSING ERROR {} not in types list".format(array[3*i+2])
        print "Types list: {}".format(self.type_list)
        sys.exit()
    return pred_list

  def _parse_unground_proposition(self, array):
    """Parses a variable proposition returning dict."""
    negative = False
    if array[1] == 'not':
      negative = True
      array = array[2:-1]
    return Predicate(array[1], array[2:-1], False, negative)

  def _parse_unground_propositions(self, array):
    """Parses possibly conjunctive list of unground propositions.

    Expects array such as [(and, (, at, ?a, ?x, ), ...].
    """
    prop_list = []
    if array[0:3] == ['(', 'and', '(']:
      array = array[2:-1]
    #Split array into blocks
    opencounter = 0
    prop = []
    for word in array:
      if word == '(':
        opencounter += 1
      if word == ')':
        opencounter -= 1
      prop.append(word)
      if opencounter == 0:
        prop_list.append(self._parse_unground_proposition(prop))
        prop = []
    #print array[:array.index(')') + 1]
    return prop_list

  def write_unfactored_domain(self, output_file):
    """Writes an unfactored MA-PDDL domain file for this planning problem."""
    file_ = open(output_file, 'w')
    to_write = "(define (domain " + self.domain + ")\n"
    #Requirements
    to_write += "\t(:requirements :typing :multi-agent :unfactored-privacy)\n"
    #Types
    to_write += "(:types\n"
    for type_ in self.types:
      to_write += "\t"
      for key in self.types.get(type_):
        to_write += key + " "
      to_write += "- " + type_
      to_write += "\n"
    to_write += ")\n"
    #Constants
    if len(self.constants) > 0:
      to_write += "(:constants\n"
      for t in self.constants.iterkeys():
        to_write += "\t"
        for c in self.constants[t]:
          to_write += c + " "
        to_write += " - " + t + "\n" 
      to_write += ")\n"
    #Public predicates
    to_write += "(:predicates\n"
    for predicate in self.agent_predicates[PUBLIC]:
      to_write += "\t{}\n".format(predicate.pddl_rep())
    for agent_type in self.agent_predicates.iterkeys():
      if agent_type != PUBLIC and len(self.agent_predicates[agent_type]) > 0:
        to_write += "\n\t{}\n".format("(:private ?agent - " + agent_type)
        for predicate in self.agent_predicates[agent_type]:
          to_write += "\t\t{}\n".format(predicate.pddl_rep())
        to_write += "\t)\n"
    to_write += ")\n"
    #Functions
    if len(self.functions) > 0:
      to_write += "(:functions\n"
      for function in self.functions:
        to_write += "\t{}\n".format(function.pddl_rep())
      to_write += ")\n"
    #Actions
    for action in self.actions:
      to_write += "\n{}\n".format(action.ma_pddl_rep())
    
    #Endmatter
    to_write += ")" #Close domain defn
    file_.write(to_write)
    file_.close()

  def write_unfactored_problem(self, output_file):
    file_ = open(output_file, 'w')
    to_write = "(define (problem " + self.problem +") "
    to_write += "(:domain " + self.domain + ")\n"
    #Objects
    to_write += "(:objects\n"
    for obj in self.agents[self.agent_list[0]].objects:
      t = self.get_type_of_object(obj)
      if not t in self.constants.iterkeys() or not obj in self.constants[t]:
        to_write += "\t" + obj + " - " + t + "\n"
    for agent in self.agent_list:
      if len(self.agents[agent].private_objects) > 0:
        to_write += "\n\t(:private " + agent + "\n"
        for obj in self.agents[agent].private_objects:
          t = self.get_type_of_object(obj)
          if not t in self.constants.iterkeys() or not obj in self.constants[t]:
            to_write += "\t\t" + obj + " - " + t + "\n"
        to_write += "\t)\n"
    to_write += ")\n"
    to_write += "(:init\n"
    for predicate in self.init:
      to_write += "\t{}\n".format(predicate)
    for function in self.ground_functions:
      to_write += "\t{}\n".format(function)
    to_write += ")\n"
    to_write += "(:goal\n\t(and\n"
    for goal in self.goal:
      to_write += "\t\t{}\n".format(goal)
    to_write += "\t)\n)\n"
    if self.metric:
      to_write += "(:metric minimize (total-cost))\n" 
    #Endmatter
    to_write += ")"
    file_.write(to_write)
    file_.close()

  def write_factored_domain(self, output_file,agent):
    """Writes an factored MA-PDDL domain file for this planning problem."""
    agent_type = self.get_type_of_object(agent)
    file_ = open(output_file, 'w')
    to_write = "(define (domain " + self.domain + ")\n"
    #Requirements
    to_write += "\t(:requirements :typing :factored-privacy)\n"
    #Types
    to_write += "(:types\n"
    for type_ in self.types:
      to_write += "\t"
      for key in self.types.get(type_):
        to_write += key + " "
      to_write += "- " + type_
      to_write += "\n"
    to_write += ")\n"
    #Constants
    if len(self.constants) > 0:
      to_write += "(:constants\n"
      for t in self.constants.iterkeys():
        to_write += "\t"
        for c in self.constants[t]:
          to_write += c + " "
        to_write += " - " + t + "\n" 
      to_write += ")\n"
    #Public predicates
    to_write += "(:predicates\n"
    for predicate in self.agent_predicates[PUBLIC]:
      to_write += "\t{}\n".format(predicate.pddl_rep())
    if len(self.agent_predicates[agent_type]) > 0:
      to_write += "\n\t{}\n".format("(:private")
      for predicate in self.agent_predicates[agent_type]:
        to_write += "\t\t{}\n".format(predicate.pddl_rep())
      to_write += "\t)\n"
    to_write += ")\n"
    #Functions
    if len(self.functions) > 0:
      to_write += "(:functions\n"
      for function in self.functions:
        to_write += "\t{}\n".format(function.pddl_rep())
      to_write += ")\n"
    #Actions
    for action in self.actions:
      if action.agent_type in self.get_supertypes_of_type(agent_type):
        to_write += "\n{}\n".format(action.pddl_rep())
    
    #Endmatter
    to_write += ")" #Close domain defn
    file_.write(to_write)
    file_.close()

  def write_factored_problem(self, output_file,agent):
    file_ = open(output_file, 'w')
    to_write = "(define (problem " + self.problem +") "
    to_write += "(:domain " + self.domain + ")\n"
    #Objects
    to_write += "(:objects\n"
    for obj in self.agents[agent].objects:
      t = self.get_type_of_object(obj)
      if not t in self.constants.iterkeys() or not obj in self.constants[t]:
        to_write += "\t" + obj + " - " + self.get_type_of_object(obj) + "\n"
    if len(self.agents[agent].private_objects) > 0:
      to_write += "\n\t(:private\n"
      for obj in self.agents[agent].private_objects:
        t = self.get_type_of_object(obj)
        if not t in self.constants.iterkeys() or not obj in self.constants[t]:
          to_write += "\t\t" + obj + " - " + self.get_type_of_object(obj) + "\n"
      to_write += "\t)\n"
    to_write += ")\n"
    to_write += "(:init\n"
    for predicate in self.init:
      if set(predicate.args) <= (self.agents[agent].objects | self.agents[agent].private_objects):
        to_write += "\t{}\n".format(predicate)
    for function in self.ground_functions:
      to_write += "\t{}\n".format(function)
    to_write += ")\n"
    to_write += "(:goal\n\t(and\n"
    for goal in self.goal:
      to_write += "\t\t{}\n".format(goal)
    to_write += "\t)\n)\n"
    if self.metric:
      to_write += "(:metric minimize (total-cost))\n" 
    #Endmatter
    to_write += ")"
    file_.write(to_write)
    file_.close()


if __name__ == "__main__":
  if len(sys.argv) < 3:
    print 'Requires 2 args'
    print 'arg1: folder'
    print 'arg2: domain'
    print 'arg3: problem'
    print 'default is out and outp'
  else:
    pp = PlanningProblem(sys.argv[1] + "/" + sys.argv[2] + ".pddl", sys.argv[1] + "/" + sys.argv[3] + ".pddl", sys.argv[1] + "/" + sys.argv[3] + ".addl")
    pp.print_problem()

    if not pp.goal_reachable:
      print "ERROR: GOAL IS NOT REACHABLE!"
      sys.exit(-1)

    if not os.path.exists(sys.argv[1] + "/"+sys.argv[2]+"-unfactored"):
      os.mkdir(sys.argv[1] + "/"+sys.argv[2]+"-unfactored")

    pp.write_unfactored_domain(sys.argv[1] + "/"+sys.argv[2]+"-unfactored"+"/" + sys.argv[2] + "-" + sys.argv[3] + ".pddl")
    pp.write_unfactored_problem(sys.argv[1] + "/"+sys.argv[2]+"-unfactored"+"/" + sys.argv[3] + ".pddl")

#    if not os.path.exists(sys.argv[1] + "/"+sys.argv[2]+"-factored"):
#      os.mkdir(sys.argv[1] + "/"+sys.argv[2]+"-factored")
#    if not os.path.exists(sys.argv[1] + "/"+sys.argv[2]+"-factored"+"/"+ sys.argv[3]):
#      os.mkdir(sys.argv[1] + "/"+sys.argv[2]+"-factored"+"/"+ sys.argv[3])

#    for agent in pp.agent_list:
#      pp.write_factored_domain(sys.argv[1] + "/"+sys.argv[2]+"-factored"+"/" + sys.argv[3] + "/" + "domain" +  "-" + agent + ".pddl",agent)
#      pp.write_factored_problem(sys.argv[1] + "/"+sys.argv[2]+"-factored"+"/" + sys.argv[3] + "/" + "problem" + "-" + agent + ".pddl",agent)




