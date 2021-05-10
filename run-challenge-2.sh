. .env

# push sample-app docker image to repository
cd challenge-2/sample-app
./push-to-registry.sh

# deploy chart via terraform
# cd ../terraform
# terraform apply \
#     -var="sample_app_image_repo=${DOCKER_REPO}/tvlk-sample-app" \
#     -var="fluentd_output_awsKey=$FLUENTD_OUTPUT_AWSKEY" \
#     -var="fluentd_output_awsSecret=$FLUENTD_OUTPUT_AWSSECRET"