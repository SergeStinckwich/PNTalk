drawing
draw
	super draw.
	class ports do: [:each | self drawPort: each ].
	class ports do: [:each | self drawArcsForTransition: each]