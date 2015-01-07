# dev-rails-base

rails base for OSX

* ruby
* rails
  * default apps
* MySQL

#### Preparation

##### VirtualBox

```
brew install virtualbox
```

##### boot2docker

install package from https://github.com/boot2docker/osx-installer/releases

```
boot2docker init
```

or

(If you have already installed old version boot2docker)
```
boot2docker upgrade
boot2docker delete
boot2docker init
```

##### fig

http://www.fig.sh/install.html

```
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig
```

#### Run

```
fig up
```
