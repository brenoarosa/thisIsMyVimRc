# thisIsMyVimRc
My vim configuration and plugins

### Install

Get and rename this folder as ".vim"
git clone git@github.com:brenoarosa/thisIsMyVimRc.git .vim

Install it running:
```
echo "runtime vimrc" > ~/.vimrc
```

### Plugins

Register and get submodules (or use --recursive flag when cloning):
git submodules init
git submodules update

#### Adding plugins

Adds repositories as submodules as:
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive

#### Upgrading all plugins

git submodule foreach git pull origin master

### Fonts

Install powerline fonts:
- From repository [fonts-powerline](https://packages.debian.org/sid/fonts-powerline)
- Downloading manually from <https://powerline.readthedocs.org/en/latest/installation/linux.html#fonts-installation>
