redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
	echo "Erreur, pas de connection avec le serveur redis!"
exit 1
while :
	for ((i=0;i<n;i++))
	do
		redis-cli LPUSH mafile $RANDOM
done

