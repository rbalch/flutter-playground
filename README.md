# Flutter Playground 

## Getting Started

This is my playground for getting a flutter app working via Docker.

For most dev work you can simply use docker and the web interface.

I started working on the vscode launch.json, but it's not working yet.

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

This starts it but it's only running bash. You need to press "r" to hot reload the app, so you'll need to do that in a shell:

```bash
make command
fwr
```

The app should then be serving from [http://localhost:8085](http://localhost:8085).

## FAQ 

### Compile Errors

Sometimes it helps to simply update everything:

```bash
flutter upgrade
flutter pub get
```

### Initial App Setup

This are the steps I took to create the app.

```bash
flutter create app
flutter build web
```
