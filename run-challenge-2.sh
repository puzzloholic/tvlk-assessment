. .env

# push sample-app docker image to repository
export DOCKER_USERNAME=$DOCKER_USERNAME
export DOCKER_PASSWORD=$DOCKER_PASSWORD
export DOCKER_REPO=$DOCKER_REPO
cd challenge-2/sample-app
./push-to-registry.sh


# deploy chart via terraform
export TF_VAR_kubectl_context=$KUBECTL_CONTEXT
cd ../terraform
terraform init
terraform apply \
    -var="sample_app_image_repo=${DOCKER_REPO}/tvlk-sample-app"
