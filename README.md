# dev-rails-base

rails base for OSX

* Web Server
  * unicorn (Rails)
  * nginx (Proxy)
* DB
  * MySQL

#### Preparation

##### VirtualBox

```
brew cask install virtualbox
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

Then, print Docker's environment.  
You run boot2docker, after setting Docker's environment to your .zshrc.

```
boot2docker up
```

##### fig

http://www.fig.sh/install.html

```
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig
```

#### Build Conitaner

```
fig build
```

#### Run

```
fig up
```

You can access `boot2docker ip` hosts.

## After running

#### apply db:migrate

```
fig run web rake db:migrate
```

#### refresh container

```
fig stop web && fig rm --force web && fig build web && fig up web
```
