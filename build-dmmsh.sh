
#!/bin/sh

# variables used by the build script
export what=omnetpp
#export what=omnest
export BUILD_CORE_DISTRO=true
export BUILD_LINUX_DISTRO=true
export BUILD_WIN64_DISTRO=true
export BUILD_MACOSX_DISTRO=true
export GIT_VERSION=origin/master

docker run -e GIT_VERSION -e what -e BUILD_CORE_DISTRO -e BUILD_LINUX_DISTRO -e BUILD_WIN64_DISTRO -e BUILD_MACOSX_DISTRO \
       omnetpp/distrobuild:eclipse472-tools170717-180105 && \
docker cp $(docker ps -lq):/root/omnetpp/out/dist/ . && \
docker rm $(docker ps -lq)
