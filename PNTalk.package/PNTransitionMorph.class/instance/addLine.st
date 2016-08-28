private
addLine
	| line |
	self addMorphBack: ((line := PolygonMorph
					vertices: {self innerBounds bottomLeft. self innerBounds bottomRight}
					color: self color
					borderWidth: borderWidth-1
					borderColor: self borderColor)
						hResizing: #rigid;
						vResizing: #rigid;
						disableTableLayout: true;
						lock;
			 			yourself).
	self adjustSubmorphPositions.
	^ line