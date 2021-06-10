docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
docker build .
docker tag $DOCKER_REPO/tvlk-sample-app $DOCKER_REPO/tvlk-sample-app:0.1.0
docker push $DOCKER_REPO/tvlk-sample-app
docker push $DOCKER_REPO/tvlk-sample-app:0.1.0