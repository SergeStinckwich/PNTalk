class initialization
newFeatures
	| w |
	w := Workspace new.
	w acceptContents: self textFeatures.
	w openLabel: 'PNtalk ', self yourVersion.