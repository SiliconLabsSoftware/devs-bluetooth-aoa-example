#!/bin/sh

display_help() {
    echo "Usage: $0 -i image_name -v version -r registry -a architecture -c clean" >&2
    echo
    echo "   -i image_name    Specify the image name, for example: devs_xg24_aoa_poc"
    echo "   -v version       Specify the version of docker image, for example: 1.0.0"
    echo "   -r registry      Specify the Docker registry to push the image to"
    echo "   -a architecture  Specify the architecture, for example: x86_64 or aarch64 (optional)"
    echo "   -c clean         Specify 'clean' to remove the built Docker image"
    echo
    exit 1
}

image_name="devs_xg24_aoa_poc"
version="1.0.0"
registry="none"
architecture="x86_64"
clean="false"

while getopts ":hi:v:r:a:c" opt; do
  case ${opt} in
    h )
      display_help
      exit 1;;
    i )
      image_name=$OPTARG;;
    v )
      version=$OPTARG;;
    r )
      registry=$OPTARG;;
    a )
      architecture=$OPTARG;;
    c )
      clean="true";;
    \? )
      display_help
      exit 1 ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      display_help
      exit 1 ;;
  esac
done
shift $((OPTIND -1))

echo "<----- Docker based Weber Wasp project building script ----->"

echo "Calling the docker image builder script..."

# Call build-docker-image.sh with arguments
sh ./.github/build-docker-image.sh -i $image_name -v $version -r $registry -a $architecture || { echo "Failed to build the Docker image"; exit 1; }

echo "<----- Running the docker based build environment ----->"
# Run the docker image
docker run -u root --rm -v $(pwd):/home/jenkins/devs_xg24_aoa_poc $image_name:$version /bin/sh -c "cd devs_xg24_aoa_poc && make all"

if [ "$clean" = "true" ]; then
    docker rmi $image_name:$version
    echo "Clean mode activated. Docker image $image_name:$version is removed."
fi
