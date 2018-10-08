To test the installer locally we created a docker image to provide a clean environment.

First build the image

    docker build \
            --file installer.Dockerfile \
            -t pure-installer \
            ./

Then run it from the project directory

    docker run \
        --name pure-installer \
        --rm \
        --interactive \
        --tty \
        --volume (pwd):/pure/ \
        pure-installer:latest

Default behavior is to run `tests/installer.test.fish` test suite.