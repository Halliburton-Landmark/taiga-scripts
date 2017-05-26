#!/bin/bash

FRONTEND_VERSION="3.0.0-stable"

pushd ~

cat > /tmp/conf.json <<EOF
{
    "api": "/api/v1/",
    "eventsUrl": null,
    "debug": "true",
    "publicRegisterEnabled": true,
    "feedbackEnabled": false,
    "privacyPolicyUrl": null,
    "termsOfServiceUrl": null,
    "maxUploadFileSize": null,
    "gitHubClientId": null,
    "contribPlugins": [],
    "gravatar": false
}
EOF


if [ ! -e ~/taiga-front ]; then
    # Initial clear
    git clone https://github.com/taigaio/taiga-front-dist.git taiga-front
    pushd ~/taiga-front
	git checkout -f Tags/3.0.0-stable

    mv /tmp/conf.json dist/

    popd
else
    pushd ~/taiga-front
    git fetch
    git checkout -f Tags/3.0.0-stable 
    git reset --hard origin/Tags/3.0.0-stable
    popd
fi

popd
