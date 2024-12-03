#!/bin/sh

display_help() {
    echo "Usage: $0 -i image_name -v version -r registry -a architecture " >&2
    echo
    echo "   -i image_name    Specify the image name, for example: bluetooth-aoa-example-build-env"
    echo "   -v version       Specify the version of docker image, for example: 1.0.0"
    echo "   -r registry      Specify the Docker registry to push the image to (optional)"
    echo "                    If internal registry is used, SonarQube will be included."
    echo "   -a architecture  Specify the architecture, for example: x86_64 or aarch64"
    echo
    exit 1
}

image_name=""
version="1.0.0"
registry="none"
architecture="x86_64"
run_sonarqube_scanner="false"

# Process the options
while getopts ":h:i:v:r:a:" opt; do
  case $opt in
    h) display_help
       exit;;
    i) image_name="$OPTARG";;
    v) version="$OPTARG";;
    r) registry="$OPTARG";;
    a) architecture="$OPTARG";;
    \?) echo "Invalid option -$OPTARG" >&2
        display_help
        exit 1;;
    :) echo "Option -$OPTARG requires an argument." >&2
       display_help
       exit 1;;
  esac
done

if [ "$registry" = "lx0017637.silabs.com:5000" ] ; then
    echo "Internal silabs build with: $registry"
    run_sonarqube_scanner="true"
fi

# Build the Docker image
echo "Building Docker image: $image_name:$version for architecture: $architecture "
docker build --build-arg ARCH="$architecture" --build-arg SONARQUBE="$run_sonarqube_scanner" -t "$image_name:$version" -f Dockerfile .

if [ -n "$registry" ] && [ "$registry" != "none" ] ; then
    docker tag "$image_name:$version" "$registry/$image_name:$version"
    docker push "$registry/$image_name:$version"
else
    echo "Docker registry not specified, skipping tagging and pushing."
fi
