drawing
draw
	model places do: [:each | self drawPlace: each].
	model transitions do: [:each | self drawTransition: each].
