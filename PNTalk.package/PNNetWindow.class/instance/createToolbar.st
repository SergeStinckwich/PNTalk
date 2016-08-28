initialize-release
createToolbar
	"create a toolbar with predefined tools"

	| toolbar |
	toolbar := AlignmentMorph newRow.
	toolbar addMorphBack: self createAddClassTool.
	toolbar addMorphBack: self createAddClassCategoryTool.
	toolbar addMorphBack: self createLayoutAgainTool.
	toolbar addMorphBack: self createReanalyzeRelationsTool.
	toolbar addTransparentSpacerOfSize: 5 @ 0.
	^toolbar