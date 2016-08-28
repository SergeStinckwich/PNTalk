stat
noWaiting: s

	| w z |
	w := s select: [:item | (item at: 1) = #waiting].
	z := w select: [:item | (item at: 3) = 0.0 ].
	^ ((z size) / (w size)).
