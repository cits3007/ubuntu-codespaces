## cits3007 ubuntu-codespaces

[![Docker hub version](https://img.shields.io/docker/v/adstewart/cits3007-codespaces?label=Docker%20Hub)](https://hub.docker.com/r/adstewart/cits3007-codespaces)

A Docker image designed to work with [GitHub Codespaces][codespaces], containing recent
versions of `gcc` and GNU `make`.

[codespaces]: https://docs.github.com/en/codespaces/overview

## Using with GitHub Codespaces

- Click the green "Code" button on GitHub to show a drop-down menu with tabs
- Select "Codespaces" from the tabs
- Click the green "Create codespace on master" button 
- GitHub Codespaces will download the Docker image and create an online IDE environment
- In the terminal shell, `gcc` and `make` will be on your `PATH`.

