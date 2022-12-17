# Development environment setup

!!! warning
    If you want to just use Euphonium on your hardware, you probably want to use our prebuilt version. This guide is for people who want to get deep into the code, and develop the software's internals.

## Introduction

Euphonium uses quite a wide variety of tools internally. We make use of the [Nix package manager](https://nixos.org/), in order to make the setup process consistent on all platforms.

### Why Nix?

We opted for Nix for a few reasons:

- It's a package manager, so it can install all the dependencies for you.
- It reproducibly installs the same versions of all dependencies for all users, so you don't have to worry about version conflicts and incompatibilites. 
- It's cross-platform, so you can use the same setup on Linux and macOS.
- Every dependency is specified in the project's conifguration so you don't need to worry about manually installing anything else.

The unfortunate consequence is that using Nix for the first time can be a bit daunting. But once you get the hang of it, it's actually quite simple.

## Prerequisites
  - A computer running Linux (NixOS, Ubuntu, Arch, etc.) or macOS.
  - The Nix package manager
    - On NixOS it is already installed, you don't need to do anything.
    - On macOS you can follow the [Nix installation instructions](https://nixos.org/download.html#nix-install-macos).
    - On other Linux distributions you should install Nix using the package manager provided by your distribution. Or you can use the [Nix installation instructions](https://nixos.org/download.html#nix-install-linux).

!!! warning
    On Windows you can use WSL2, to run a Linux distribution with Nix in it. Unfortunately, none of the Euphonium developers use Windows, so we can't provide any support for it. If you do get it working, please let us know how you did it!

## Checkout code

When checking out the repository, use `--recursive` to retrieve all submodules. Alternately, after checkout use `git submodule update --init --recursive` to perform the same task.

```sh
git clone --recursive https://github.com/muvox-io/euphonium
```

!!! tip
    If you forgot to use `--recursive`, you can run `git submodule update --init --recursive` inside of the repository to retrieve the submodules.

## Enter the nix development shell

Navigate to the cloned repository, and run `nix develop` to enter the development shell. The first run might take a few minutes before it finishes, as it needs to download and install all the dependencies. Subsequent runs will be much faster.

```sh
nix develop

```
nix develop
Euphonium dev environment is now active
[user@ohst:~/Projects/euphonium]$ 
```
You can now use this shell to build and work on Euphonium.


