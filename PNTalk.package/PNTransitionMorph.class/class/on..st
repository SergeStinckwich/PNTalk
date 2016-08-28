as yet unclassified
on: aModel
	^ super newColumn 
		color: Color transparent;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 1;
"		borderColor: Color black;
		borderWidth: 1;"
		wrapCentering: #left;
		cellPositioning: #topLeft;
		on: aModel.