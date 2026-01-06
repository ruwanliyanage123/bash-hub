#!bash

VERSION="1.0.0"
MEMORY="1024m"
REPOSITORY="org_comp"
PROJECT="java_with_alpine"

set -e

docker build -t ${PROJECT}:latest .
docker tag ${PROJECT}:latest ${REPOSITORY}/${PROJECT}:${VERSION}
docker run -d \
--memory=${MEMORY} \
--name=${PROJECT} \
--cpus="4"
--p 8080:8080
java_with_alpine:${VERSION}
docker push ${REPOSITORY}/${PROJECT}:${VERSION}
echo "Done successfully"
