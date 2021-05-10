docker build ./challenge-1 -t tvlk-assessment-challenge-1 -f challenge-1/Dockerfile
docker run -v $(pwd)/challenge-1:/data tvlk-assessment-challenge-1