stat
maxTime: s

	| max w |
	max := 0.
	w := s select: [:item | (item at: 1) = #waiting].
	w do: [:item | max := max max: (item at: 3) ].
	^ max.