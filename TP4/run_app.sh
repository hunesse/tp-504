CONTAINER_NAME="tp4-app"
IMAGE_NAME="im-tp4"

docker network inspect net-tp4 > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Le réseau net-tp4 n'existe pas, création du réseau..."
    docker network create net-tp4
fi

echo "Lancement du conteneur Docker nommé $CONTAINER_NAME à partir de l'image $IMAGE_NAME..."

docker run -d \
  --name $CONTAINER_NAME \
  --network net-tp4 \
  -p 5000:5000 \
  $IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "Le conteneur $CONTAINER_NAME a démarré avec succès, et le port 5000 est exposé sur l'hôte."
else
    echo "Erreur lors du démarrage du conteneur $CONTAINER_NAME."
    exit 1
fi

