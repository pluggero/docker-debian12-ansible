# Debian 12 (Bookworm) Ansible Test Image

[![CI](https://github.com/pluggero/docker-debian12-ansible/actions/workflows/build.yml/badge.svg)](https://github.com/pluggero/docker-debian12-ansible/actions/workflows/build.yml) [![Docker pulls](https://img.shields.io/docker/pulls/pluggero/docker-debian12-ansible.svg?maxAge=2592000)](https://hub.docker.com/r/pluggero/docker-debian12-ansible/)

Debian 12 (Bookworm) Docker container for Ansible playbook and role testing.

## Tags

- `latest`: Latest stable version of Ansible, with Python 3.x.

## How to Build

This image is built on Docker Hub automatically any time the upstream OS container is rebuilt, and any time a commit is made or merged to the `main` branch. But if you need to build the image on your own locally, do the following:

1. [Install Docker](https://docs.docker.com/engine/installation/).
2. `cd` into this directory.
3. Run `docker build -t docker-debian12-ansible .`

## How to Use

1. [Install Docker](https://docs.docker.com/engine/installation/).
2. Pull this image from Docker Hub: `docker pull pluggero/docker-debian12-ansible:latest` (or use the image you built earlier, e.g. `docker-debian12-ansible:latest`).
3. Run a container from the image: `docker run --detach --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro pluggero/docker-debian12-ansible:latest` (to test my Ansible roles, I add in a volume mounted from the current working directory with ``--volume=`pwd`:/etc/ansible/roles/role_under_test:ro``).
4. Use Ansible inside the container:
   a. `docker exec --tty [container_id] env TERM=xterm ansible --version`
   b. `docker exec --tty [container_id] env TERM=xterm ansible-playbook /path/to/ansible/playbook.yml --syntax-check`

## Notes

I use Docker to test my Ansible roles and playbooks on multiple OSes using CI tools like Jenkins and Travis. This container allows me to test roles and playbooks using Ansible running locally inside the container.

> **Important Note**: I use this image for testing in an isolated environment—not for production—and the settings and configuration used may not be suitable for a secure and performant production environment. Use on production servers/in the wild at your own risk!
