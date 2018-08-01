#!/bin/sh

WATCH="${WATCH:=false}"
SLEEP="${REFRESH_TIME:=-1}"

HUGO=/usr/local/bin/hugo

while [ true ]
do
    if [[ $WATCH != 'false' ]]; then
	    echo "Watching..."
        $HUGO server --watch=true \
                     --source="/src/${SERVICE_NAME}" \
                     --destination="/output/${SERVICE_NAME}" \
                     --gc \
                     --port="80" \
                     --baseURL="${BASEURL}" \
                     --bind="0.0.0.0" "$@" || exit 1
    else
	    echo "Building one time..."
        $HUGO --source="/src/${SERVICE_NAME}" \
              --destination="/output/${SERVICE_NAME}" "$@" || exit 1
    fi

    if [[ $REFRESH_TIME == -1 ]]; then
        exit 0
    fi
    echo "Sleeping for $REFRESH_TIME seconds..."
    sleep $SLEEP
done