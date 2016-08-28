menu actions
newPrototypeObject

  | str |

  str:=UIManager default request: 'New folder name' initialAnswer: 'noname'.
  str := self assureComponentName: str.
  str~='' & str notNil ifTrue: [ 
	self addComponents: {str -> PrototypeObjectForMyRepository new} ].

	
