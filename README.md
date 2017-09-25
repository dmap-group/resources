# Distributed Multiagent Planning Resources
##### [Planning Group](http://agents.felk.cvut.cz/topics/multi-agent_planning_and_resource_allocation) at [Department of Computer Science](http://cs.felk.cvut.cz/), [FEE](http://www.fel.cvut.cz/en/), [CTU in Prague](https://www.cvut.cz/en).


Repository for DMAP-related resources (benchmarks, coversion scripts, competitions, ...) 

Competitions:
* Competition of Distributed and Multiagent Planners: [CoDMAP](http://agents.fel.cvut.cz/codmap/).

Planner repositories:
* MAPlan: https://github.com/danfis/maplan
  * multiagent and singleagent planning
  * centralized, parallelized and distributed planning
  * state-space search
  * various heuristics
  * model: MA-MPT (multiagent multivalued planning task)
  * languages: MA-PDDL
  * codes: C
  * weak privacy preservation (obfuscation by hashing)
  * more info: [pages 8-10](http://agents.fel.cvut.cz/codmap/results/CoDMAP15-proceedings.pdf)
* PSM: https://gitlab.fel.cvut.cz/tozicjan/psm-planner
  * multiagent and singleagent planning
  * centralized, parallelized and distributed planning
  * plan-space search, local state-space search ([FastDownward](http://www.fast-downward.org/)), compact plan representation
  * delete-relaxation heuristics for initial plans
  * model: Finite State Machine in form of Planning State Machine (PSM), SAS+ ([FastDownward](http://www.fast-downward.org/))
  * languages: MA-PDDL
  * codes: Java, C++ ([FastDownward](http://www.fast-downward.org/))
  * weak privacy preservation (theoretical strong privacy variant exists (http://www.scitepress.org/DigitalLibrary/Link.aspx?doi=10.5220/0006176400510057))
  * more info: [pages 29-32](http://agents.fel.cvut.cz/codmap/results/CoDMAP15-proceedings.pdf)
* MADLA Planner: https://github.com/stolba/MADLAPlanner
  * multiagent and singleagent planning
  * centralized and parallelized planning
  * state-space search
  * various heuristics
  * model: MA-STRIPS, MA-MPT
  * languages: MA-PDDL, PDDL+ADDL
  * codes: Java
  * weak privacy preservation
  * more info: [pages 21-24](http://agents.fel.cvut.cz/codmap/results/CoDMAP15-proceedings.pdf)


