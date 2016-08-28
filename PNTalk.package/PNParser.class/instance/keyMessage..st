parsing net
keyMessage: id1

| celk args ky dic |

celk := id1.
args := OrderedCollection with: (self id).

[
	ky := self key.
	ky isNil ] 
		whileFalse: [
			celk := celk, ky.
			args add: (self id).
		].


dic := Dictionary new.
dic at: #selector put: celk.
dic at: #args put: args.

^dic