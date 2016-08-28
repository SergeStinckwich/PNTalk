MyRepository is a folder which contains named components. Each component must understand to the same accessing protocol as MyRepository.

MyRepository root (stored in a class instance variable) represents a root of a hierarchy of objects. Each component (storeable object) in the hierarchy is globally identifiable by its pathname. Originally, as part of SmallDEVS package, it was designed to contain models and simulations. Now it is used more generally. 

Simulations are supposed to be subclasses of AbstractSimulation. An exampe of a simulation is a CoupledDevs wrapped by DEVSRootSolver (see SM package SmallDEVS). The CoupledDEVS is also a folder - it contains named components. 

Other kinds of storeable objects are Document and LaTeXDocument.


Example:

MyRepository Initialize.
MyRepository root explore.
MyRepository openBrowser.
(MyRepository root componentNamed: 'Prototypes') explore.

Further development leads towards an in-image "filesystem".

To do: Protocol for editing ordering of components.

