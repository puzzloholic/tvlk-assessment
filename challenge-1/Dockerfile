FROM ubuntu

RUN apt update && \
    apt install -y jq curl

WORKDIR /app
COPY github-stats.sh .
RUN chmod +x /app/github-stats.sh

CMD [ "/app/github-stats.sh" ]