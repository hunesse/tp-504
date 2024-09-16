def puissance(a,b):
#	if not type(a) is int:
#		if not type(b) is int:
#			raise TypeError("Uniquement des chiffre entier")
	#return a**b
	
	if b == 0:
		return 1
	elif b > 0:
		resultat = a
		for _ in range(1, b):
			resultat *= a
		return resultat
	else:
		return 1 / puissance(a, -b)
