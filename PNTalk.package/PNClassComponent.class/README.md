c := PNCompiledClass new.
c yourSuperClass: 'PN'.
c parent: aDirectory.
c compileNet: 'a source code'.
c componentNames
(c componentNamed: 'name') sourceCode.
