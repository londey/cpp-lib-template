set -x


export DOCKER_IMAGE_TAG=cpp-lib-template-linux-build

# create build environment
docker build --file linux.Dockerfile --tag ${DOCKER_IMAGE_TAG} .

# build library
docker run --rm -v ${PWD}/..:/working -t ${DOCKER_IMAGE_TAG} sh /build.sh

