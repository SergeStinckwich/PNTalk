processing
test
	"Testing a transition to firable."

	| listVar testing |
	listVar := PNtalkDictionary space: (self object yourClass parent).
"	listVar at: #self put: (self object newProxy)."
	listVar at: #self put: self object.

	testing := PNTransitionTesting newIn: self.
	testing arcGoals: arcGoals; guardGoals: guardGoals.
	bindings := testing complexTest: listVar.
	^ (bindings size > 0).
