# What is Eclipse?

Eclipse is an integrated development environment (IDE). It contains a base workspace and an extensible plug-in system for customizing the environment.
Written mostly in Java, Eclipse can be used to develop applications. By means of various plug-ins, Eclipse may also be used to develop applications in other programming languages.
Development environments include the Eclipse Java development tools (JDT) for Java and Scala, Eclipse CDT for C/C++ and Eclipse PDT for PHP, among others.

> http://eclipse.org/

# How to use this image

## Concept

This docker image is for using Eclipse for PHP development. It installs Eclipse on top of Fedora 21 using the Fedora packages. Additional plugins
are installed with `equinox.p2.director` application inside Eclipse.

For running the GUI of Eclipse, the same user who runs the build is created inside the image. With forwarding required variables and mounting files the GUI is forwarded to the X-Server of the host.

## Build the image

To build the image, simply run the script `build.sh`. It will replace variables in `Dockerfile` and executes the docker build command.

## Run the eclipse docker image

Before you run the image, you have define an environment variable pointing to the root directory of your workspaces. This directory is mounted to the image.
You can define that variable in your `.bashrc` file:

    export ECLIPSE_WORKSPACE_ROOT=${HOME}/workspaces

For running Eclipse just execute the script `eclipse.sh`. This will run the docker image with all required parameters.

## Install script

For simplicity you can install the script `eclipse.sh` inside you PATH, for example in `/usr/local/bin/eclipse`.

# User Feedback

## Issues

If you have any problems with or questions about this image, please create a [GitHub issue](https://github.com/mjanser/eclipse-docker/issues).

## Contributing

You are invited to contribute new features, fixes, or updates. Just fork the repository and create a pull request.
