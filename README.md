# pde

> Neovim: your personalized development environment (pde) for Python

## Abstract

As developers continue to embrace Python for their projects, the need for a powerful, flexible, and efficient development environment has become increasingly important. [Neovim](https://neovim.io/) is an open-source text editor designed to enhance the traditional Vim editor, providing a modern, extensible, and highly configurable tool for developers.

In this context, using Neovim as a Python development environment offers numerous benefits, such as keyboard driven development, streamlined workflows, and a range of plugins and extensions to enhance productivity. Neovim's modular architecture allows for customization, automation, and integration with other tools and frameworks.

The goal of this talk is to set you up with Neovim without losing beloved features like Python language support, autocompletion, testing, file navigation, among others. In the course of 30 minutes, I will walk you through a base configuration that you can build atop of to make an IDE that is truly yours.

## Talk Overview

- **Introduction to Neovim:** core offering, pros and cons, lua language for pythonistas
- **Neovim for Python Development:** plugin manager, navigation, terminal integration, lsp, testing
- **Wrap up:** brief look at my personal config and learning resources to continue your journey

## Requirements

- [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/): if you want to run Neovim from a preconfigured container
- [vim keybindings](https://vim.rtorr.com/): knowledge of basic movements and commands should be fine

## Project Structure

- [hpsort](./hpsort): example Python project to test editor functionality
- [nvim](./nvim): base configuration that is loaded in the container

## Usage

```shell
# Run the container environment
make run

# Start neovim which install plugins and then exit out with `:qa`
⬢ [Docker] nvim

# Start neovim again - You should be fully setup!
⬢ [Docker] nvim
```

Checkout [nvim](./nvim) README to find out more about the configuration structure and available keybinds.

## Debugging

- **Spawning language server with cmd: `pyright-langserver` failed. The language server is either not installed, missing from PATH, or not exeecutable.**: sometimes the language server is not completely setup. So run `:Mason` command to prompt installation. After the tools are installed, you can hit `q` to quit.
