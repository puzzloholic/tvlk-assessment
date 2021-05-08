#!/bin/bash

stats(){
    check_limit_reset(){
        RATE_LIMIT_RESET=$(curl -s "$GITHUB_HOST/rate_limit" \
            -H "Accept: application/vnd.github.v3+json" \
            | jq -r '.rate.reset')
    }
    check_limit_remaining(){
        RATE_LIMIT_REMAINING=$(curl -s "$GITHUB_HOST/rate_limit" \
            -H "Accept: application/vnd.github.v3+json" \
            | jq -r '.rate.remaining')
        if [ $RATE_LIMIT_REMAINING -lt 1 ]; then
            check_limit_reset
            echo "Rate limit exceeded, sleeping until $(date -d @$RATE_LIMIT_RESET)"
            SLEEP_TIME=$(( $RATE_LIMIT_RESET - $(date +%s) + 3 ))
            sleep $SLEEP_TIME
        fi
    }
    REPO_NAME=$1
    check_limit_remaining
    REPO_INFO=$(curl -s "$GITHUB_HOST/repos/$REPO_NAME" \
        -H "Accept: application/vnd.github.v3+json")
    if echo $REPO_INFO | jq -e 'has("message")' > /dev/null; then 
        echo -n $REPO_NAME": "
        echo $REPO_INFO | jq -r '.message'
    else
        check_limit_remaining
        LATEST_COMMIT_INFO=$(curl -s "$GITHUB_HOST/repos/$REPO_NAME/commits?per_page=1" \
            -H "Accept: application/vnd.github.v3+json")

        CLONE_URL=$(echo "$REPO_INFO" | jq -r '.clone_url')
        COMMIT_DATE=$(echo "$LATEST_COMMIT_INFO" | jq -r '.[].commit.author.date')
        COMMIT_AUTHOR=$(echo "$LATEST_COMMIT_INFO" | jq -r '.[].commit.author.name')
        echo $REPO_NAME","$CLONE_URL","$COMMIT_DATE","$COMMIT_AUTHOR
    fi
}

# N=4
# i=0
GITHUB_HOST=https://api.github.com
# if [ -f repos.txt ]; then

# fi
echo "repo_name,clone_url,commit_date,commit_author"
while read REPO_NAME; do
    stats "$REPO_NAME"
    # ((i=i%N)); ((i++==0)) && wait
done < repos.txt