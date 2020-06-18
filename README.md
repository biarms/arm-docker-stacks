# Brothers in ARMs' project

## Overview
The Raspberry Pi and most of the other similar ARM processors based devices are just great and fun:
it exists thousand of micro projects on the web designed to run on these single board computers.

However, most of these projects are proposing us to burn a sd card.
But we don't have 20 SD-cards, and we don't want to have to switch between SD Cards. We just want to have and one SD card, that will contain some of these fun projects,
and a possibility to turn on and off these projects (because we all know that our small computer can't start them all at the same time).

That's one of the reason of the birth of the 'Brother in Arms' project.

But more generally, the 'Brother in Arms' projects' goals are:
 - be able to bring on a single SD-Card some of the great open-source projects we can find all over the web
 - provide a simple way to install them
 - provide binaries that user can trust

And how will we do this ? Thanks to Docker !

Currently, the work is in progress, and we are far for where we want to go.
But we started anyway to publish some first alpha project, just in case other people wants to joint ;)
In that case, don't hesitate to contact the Brother In Arms's project team via project.biarms@gmail.com.

If you are interested to test where we are, have a look to https://github.com/biarms/bootstrap.

## Road Map
### Setup an 'infra' layer that will offer basic services:
1. Setup a pi with wifi and access point (first wlan -> connect the network, second wlan: provide an access point)
2. Portainer, to see what is running
3. Shairport-sync to play music on my legacy hifi system with my iPhone thanks to AirPlay
4. A DynDNS service to expose the box on Internet (if needed)
5. An email service, to be able to send email

### Setup an 'admin' env
1. The admin env MUST be able to turn on and off the 'application' listed below
2. The admin env COULD be able to configure part of the system

### Setup an 'application layer' that could provide some easy to install ARM-based docker stack (that's the goal of this repo):
1. Deploy a WordPress env to host a Blog
2. Deploy Ghost (because its is a good alternative to Wordpress)
3. Deploy NextCloudPi

## Requirements / Guidelines
1. New application add-on MUST be based on docker
2. New application add-on SHOULD only use 'trusted docker' container (only official images, otherwise, we rebuild). We have infinite
   thanks for hypriot and resin team's, but as docker is now working out-of-the-box on arm-ubuntu, raspbian, etc, we prefere to use
   the 'main stream'.
3. No more docker compose, but docker stack (to be ready to deploy in a SWARM or K8S cluster. The 'single device' mode
   will be based on a 'docker swarm with only one node'. (MUST)
4. Use 'secret_file' instead of env variable or secret variable to store secrets (SHOULD)
5. When possible, Dockerfile should be based on 'alpine:3.11.6' (alternative: every biarms rebuild image SHOULD inherit from the same base image, to reduce disk usage)

## Release-Notes - Roadmap
### Iteration 1 (v0.0.1)
 - [x] Build Mysql and WordPress image with the 'arm' architecture flag on (needed for swarm), supporting '_file' extension
       (ie: MYSQL_ROOT_PASSWORD_FILE)
 - [x] Deploy WordPress
 - [x] Focus on RPI1 + Odroid XU4 only (OrangePi + RPI2/3 should be OK, but were not tested)
 
### Iteration 2 (v0.0.1)
 - [x] Deprecated (at least temporary) RPI1 support, because of 'docker pull' bug (version 19.03.8) for 'arm32v6' device with 'CPU architecture' set to 7. 
       See https://github.com/biarms/mysql/issues/4 -> https://github.com/moby/moby/issues/41017 -> https://github.com/moby/moby/issues/34875
 - [x] Add [Gogs](https://gogs.io/) and [Portainer](https://www.portainer.io/) stacks
 - [x] Add [Gitea](https://gitea.io/) stacks, but only for arm64v8 and arm64 platform (Gogs should be used for older/smaller devices)
 - [x] Add amd64/x86_64 support
 - [x] Focus on arm32v7('Odroid XU4') and arm64v8('RPI3') only (OrangePi should be OK, but were not tested)
 - [x] Create an Wifi access point docker container (with hardcoded ip)
 - [x] Create a stack to start [Portainer.io](https://www.portainer.io/)

### Iteration 3
 - [ ] Create a stack to install [Nextcloud](https://nextcloud.com/) 
 - [ ] Create an UI application to help people to install these tools
 - [ ] Create a bootable image embbeding this UI application (base on ubuntu-20.04-aarch64 ?) that should run on RPI3 and RPI4

## Next steps (?)
 - [ ] Also create a bootable image for other arm devices
 - [ ] Create a git repo per stack
 - [ ] Add more funny arm based and open-source stacks (ie: shairport-sync)

## Releases
See https://github.com/biarms/arm-docker-stacks/releases