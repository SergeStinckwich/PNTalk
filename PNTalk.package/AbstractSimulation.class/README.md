AbstractSimulation provides basic means for asynchronous simulation control - see #start, #stop, #rtFactor etc in "simulation control" category. A simulation runs as a background process.
A simple simulation run in foreground is also possible via #simulate:.
Subclasses have to specify simulationStep and may specify prepareToStart and prepareToStop.

Subclasses can be put to MyRepository and used in multisimulation experiments.

Note: Since the simulation runs as a sequence of steps, there could be possible to think about an alternative implementation which cyclically performs steps in all simulations in MyRepository - this could be an alternative to to background processes for all simulations. Independent schedulers would be possible. To do (?).  
