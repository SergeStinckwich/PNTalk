as yet unclassified
on: aRepo title: aTitle

  | l |

  super initialize.
  self setLabel: aTitle.
"  list := PNRepositoryList new."
  list := MyRepositoryList new.
  l := list createList: aRepo.
  self addMorph: l frame: (0@0 extent: 1@1).
  self extent: 250@430.
  self paneColor: (Color lightGray).