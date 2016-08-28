accessing
start
	"Otestovani, spusteni objektu, spusteni ridiciho procesu.
	 Simulace zustava zastavena."

"	self test."
	self dTest.
	self componentsDo: [:item | item start ].
	super start.
"	parent tryStep."

