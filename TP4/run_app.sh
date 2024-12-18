CONTAINER_NAME="tp4-app"
IMAGE_NAME="im-tp4"


docker run -d \
  --name tp4-app \
  --mount type=bind,source="$(pwd)",target=/srv/ \
  --network net-tp4 \
  -p 5000:5000 \
  im-tp4:latest


