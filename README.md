# KastMates Story App

## Getting Started

This project is a flutter application with firebase backend.

For most dev work you can simply use docker and the web interface.

### Install

You will need to install docker.

First time:

1. Make sure you have vscode volume:

```bash
docker volume create --name vscode-server
```

2. Build the docker image:

```bash
make build
```

### Run

```bash
make up
```

The app should then be serving from [http://localhost:8085](http://localhost:8085).

## FAQ 

### Compile Errors

Sometimes it helps to simply update everything:

```bash
flutter upgrade
flutter pub get
```
