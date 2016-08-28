as yet unclassified
nameInSimSpace: n

	self parentInSimSpace removeComponents: { self nameInSimSpace }; addComponents: { n -> self }.
