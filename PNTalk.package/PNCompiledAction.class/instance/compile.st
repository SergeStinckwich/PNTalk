compiler
compile

"	self compileWithPrefix: '[:listV :this :context | context processMessage: '."
	self compileWithPrefix: '[ context processMessage: '.
