stat
avgTime: s
	
	| sum w |
	sum := 0.
	w := s select: [:item | (item at: 1) = #waiting].
	w do: [:item | sum := sum + (item at: 3) ].
	^ (sum / (w size)) asFloat.
"
	storageSize do: [:v | sum := sum + v].
	^ (sum / (storageSize size)) asFloat."