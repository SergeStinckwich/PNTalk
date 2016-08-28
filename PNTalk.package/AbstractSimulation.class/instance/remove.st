GUI
remove
  (UIManager default confirm: 'Really DELETE simulation?')
  ifTrue: [ parent removeComponents: (Array with: name) ].