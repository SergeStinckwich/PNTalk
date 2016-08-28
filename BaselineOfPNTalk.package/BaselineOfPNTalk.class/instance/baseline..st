baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec package: 'PNTalk'.
		spec group: 'default'
			with: #(PNTalk).
	]