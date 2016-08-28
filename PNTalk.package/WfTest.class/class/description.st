as yet unclassified
description	
	| str w |	
	str := '"The Workflow example
==================
(For more details about this model please take a look at the WWW home pages: http://perchta.fit.vutbr.cz/pntalk2k)

The Structure class is the entry point to this example. To get the class Structure, we have to ask MyRepository for the repository of PNtalk classes and then we have to ask that repository for the component (class) named Structure.	
	
	structureClass := MyRepository objectWithPathName: ''/PNtalk classes/DJDExample/Structure''.
	
To create an instance of some class in the simulation world we will call newIn: on the PNtalk class. The argument is the world we wish to add the instance. In our example, we will work with default simulation world (PNtalkSimulation default world). You can observe the simulation state at MyRepository window in the folder "PNtalk simulations" -- the symbol [R] (running) or [S] (stopped). Now you can experiment with the simulation by means of MyRepository tools (right mouse button).	
	
	structure := structureClass newIn: (PNtalkSimulation default world).
"'.	
	
	w := Workspace new.	
	w acceptContents: str.	
	w openLabel: 'PNtalk: A Workflow Example'.
