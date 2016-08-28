private
textWelcome
^ '"A guide to the PNtalk System.
========================

Note: The strings that are presented between letters [[ and ]] are ready to do-it (or inspect-it) action.

*** Basic system classes:
- MyRepository is the top level repository of the SmallDEVS system. The PNtalk objects are stored in this structure.
- PNtalkSimulation is the interface between PNtalk and SmallDEVS simulation. It is necessary to the PNtalk-SmallDEVS intercorporation.
- PNtalkWorld provides the PNtalk simulation.
- PNCompiledClass represents the compiled PNtalk class.
- PNObject represents an instance of the PNtalk class.

*** Basic actions:
- [[ PNtalkSystem initialize ]] inits the PNtalk system running on the SmallDEVS (it is done immeditaly the PNtalk package is loaded).
- [[ PNtalkSystem welcome ]] opens this window.
- [[ MyRepository openBrowser ]] opens the MyRepository browser. MyRepository contains all objects in the SmallDEVS/PNtalk system and it serves for the system interfacing. Except that way you can also use the metaobject protocol to work with the system.

*** There are two basic folders in the MyRepository: 
- PNtalk classes [[ MyRepository componentNamed: ''PNtalk classes'' ]] contains a collection of PNtalk classes (the name spaces and the visual display of class hierarchy is not allowed for now). The command [[ PNCompiledClass defaultRepository ]] takes the same action and, in addition, if the repository does not exists it will be created.
- PNtalk simulations [[ MyRepository componentNamed: ''PNtalk simulations'' ]] contains a collection of PNtalk simulations. Each simulation has its own simulator (instance of the class PNtalkSimulation). There is always one default simulation as you can see in the MyRepository hierarchy. If you want to get the default simulation then do the command [[ PNtalkSimulation default ]]. In the case the default simulation repository does not exists it will be created. 

The commands over each folder is available on the right mouse button. In the case of simulation only the start, stop, and delete commands are useful now.

*** The basic metaprotocol:
To get the folder named aName from the top level repository:
[[ repository := MyRepository componentNamed: ''aName''. ]] 
To get a component from the repository:
[[ component := repository componentNamed: ''aName''. ]]
To get the world of a default simulation:
[[ world := ((MyRepository componentNamed: ''PNtalk simulations'') componentNamed: ''Default'') world. ]]
or
[[ world := MyRepository objectWithPathName: ''/PNtalk simulations/Default'' world. ]]
or
[[ world := PNtalkSimulation default world. ]]

*** The basic work:
To work with classes see ''PNtalk classes'' repository tools (accesible from the MyRepository browser).
To get a class from repository:
[[ class := aRepository componentNamed: ''aName''. ]]
[[ class := MyRepository objectWithPathName: ''/PNtalk classes/DJDExample/Structure''. ]]
To get an instance of the class:
[[ object := class newIn: theWorld. ]]

*** To better know how to work with the system you can enter the category ''PNtalk-Core-Documentation''. It consists of classes describing the examples including the annotated code. For introdution to the example send the message [[ description ]] to the appropriate class. Source codes of the presented models are available via the MyRepository.
- [[ WfTest description ]] - basic simulation creation
- [[ DebugGuide description ]] - how to debug simulation run
- [[ PNtalkServerGuide description ]] - remote working with models and simulations
- [[ PNtalkStateGuide description ]] - state manipulation and calling OOPN method from Smalltalk

"'.