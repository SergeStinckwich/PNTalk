as yet unclassified
initialize

  | l |

  super initialize.
  self setLabel: 'MyRepository'.
  list := MyRepositoryList new.
  l := list createList: (MyRepository root).
  self addMorph: l frame: (0@0 extent: 1@1).
  self extent: 250@430.
  self paneColor: (Color lightGray).