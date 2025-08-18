# Containerized Development Environments

This repository provides Dockerfiles for creating ready-to-use development environment Docker images. The goal is to streamline the setup of various development tools and dependencies, allowing developers to quickly spin up consistent and isolated environments.

Development tools even can have security issues, and generally they have system level access. Its hard to manage when you have single device for both personal and work purposes, or even for your personal projects. Let's be more safe and secure. Maintaining development environments within docker images brings benefit of easy clean-up, its generally very hard to keep track of caches, stale data after you uninstall a development tool. Don't ask me how I know it...

## Purpose

The main purpose of this repository is to:
- **Provide pre-configured development environments:** Each Dockerfile is tailored to a specific development stack, including necessary tools, libraries, and configurations.
- **Ensure consistency:** By using Docker images, we can guarantee that all developers are working with the exact same environment, reducing "it works on my machine" issues.
- **Simplify dependency management:** All dependencies are encapsulated within the Docker image, eliminating the need for manual installation and configuration on the host machine.
- **Enable rapid prototyping and testing:** Quickly switch between different development environments without polluting your local system.

## Dependencies Included

Each development environment is built on top of the base image which is based on Debian Bookworm with Zsh and Oh-my-zsh
set-up ready.

### Common Dependencies:
- `git`: Version control system.
- `curl`, `wget`: Command-line tools for transferring data.
- `build-essential` (or equivalent): Compilers and development libraries.
- `vim`, `nano`: Text editors.
- `zsh`, `oh-my-zsh`: Enhanced shell experience.

### Language-Specific Dependencies (Examples):

#### Node.js:
Node image is using `nvm` tool, so that within single environment several node versions can be easily managed. Image comes with
LTS version installed by default. Yarn and PNPM is not installed.

#### Bun:
Similar to Node image, it is using `bum` version manager tool so several bun versions can be managed easily.

## Usage

You must have Docker installed and running in your system. Performance is affected by your Docker configuration, please configure your resources accordingly. There still can be a performance bottleneck, since its not a full local resources access.

1. Build base image

```sh
docker build . --file base.Dockerfile --tag basedevimage:bookworm
```

2. Build your environment image (i.e. Bun)

```sh
docker build . --file bun.Dockerfile --tag bundevimage:bookworm
```

3. Start your container

```sh
docker run -it bundevimage:bookworm
```

You can either directly clone all your code inside the container or attach your existing code as volume
to the container and build/run your project. Optionally you can utilize an IDE environment as well.

#### Using with Visual Studio Code (or Cursor)

a. Open your IDE and install [dev containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

b. Open your folder for your project within your IDE

c. Create `.devcontainer/devcontainer.json` file inside your project's root directory, check `examples` folder within the repo

d. Reopen your project inside the container

e. Check VS Code [docs](https://code.visualstudio.com/docs/devcontainers/create-dev-container) for more details

With this toolset you can keep your local environment very clean, you don't need to install any helper toolsets like Redis, Mongo or PostgreSQL, utilize their existing Docker images in your one-click development environment. Check `examples/compose-dev.yml` file for an example.
