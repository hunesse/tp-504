docker network create --driver bridge net-tp4

docker network ls | grep net-tp4
if docker network ls | grep -q "net-tp4"; then
    echo "Réseau crée"
else
    echo "Réseau déjà existant"
fi
