def puissance(a,b):
	if not type(a) is int:
		if not type(b) is int:
			raise TypeError("Uniquement des chiffre entier")
	return a**b

