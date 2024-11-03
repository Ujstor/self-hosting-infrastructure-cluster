#!/bin/bash

eval $(yq e '.docker | to_entries | .[] | "export \(.key)=\(.value)"' docker-config.yml)

DOCKER_IMAGE="$DOCKER_HUB_USERNAME/$DOCKER_REPO_NAME"

TAGS=$(curl -s "https://hub.docker.com/v2/repositories/$DOCKER_IMAGE/tags/?page_size=100" | jq -r '.results[].name')

if [ -z "$TAGS" ]; then
    DEFAULT_TAG="0.0.1"
    NEW_TAG="$DEFAULT_TAG"
else
    LATEST_TAG=$(echo "$TAGS" | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -n 1)

    if [ -z "$LATEST_TAG" ]; then
        LATEST_TAG="0.0.1"
    fi

    IFS='.' read -ra PARTS <<< "$LATEST_TAG"
    MAJOR=${PARTS[0]}
    MINOR=${PARTS[1]}
    PATCH=${PARTS[2]}

    if [[ "$VERSION_PART" == "Major" ]]; then
        NEW_TAG="$((MAJOR + 1)).0.0"
    elif [[ "$VERSION_PART" == "Minor" ]]; then
        NEW_TAG="$MAJOR.$((MINOR + 1)).0"
    elif [[ "$VERSION_PART" == "Patch" ]]; then
        NEW_TAG="$MAJOR.$MINOR.$((PATCH + 1))"
    else
        echo "Invalid version part specified. Usage: $0 [Major|Minor|Patch]"
        exit 1
    fi
fi

create_env_file() {
    cat << EOF > .env
DOCKER_REPO_NAME=$DOCKER_REPO_NAME
NEW_TAG=$NEW_TAG
PUSH_TO_DOCKER=$PUSH_TO_DOCKER
EOF
}

create_env_file
