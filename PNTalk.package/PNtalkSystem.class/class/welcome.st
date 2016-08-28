class initialization
welcome
	| w |
	w := Workspace new.
	w acceptContents: self textWelcome.
	w openLabel: 'PNtalk ', self yourVersion.