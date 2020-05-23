Master repository to manage LawHub project development environment

## Prerequisites
* pyenv
* pipenv

Note that you first need to install following libraries to build pyenv on a minimum AWS instance ([pyenv wiki](https://github.com/pyenv/pyenv/wiki/common-build-problems])):
```
sudo yum install @development zlib-devel bzip2 bzip2-devel readline-devel sqlite \
sqlite-devel openssl-devel xz xz-devel libffi-devel findutils
```

## Setup
```
mkdir lawhub && cd lawhub
git clone https://github.com/lwhb/lawhub-dev.git
```
You can use a different parent directory name instead of lawhub if you want.

### Python
```
cd lawhub-dev
pipenv install 
pipenv shell
```

### Repositories
```
./init.sh
```
This will clone all the sub repositories under lawhub directory: [lawhub
](https://github.com/lwhb/lawhub), [lawhub-xml](https://github.com/lwhb/lawhub-xml), [lawhub-spider](https://github.com/lwhb/lawhub-spider), [lawhub-tool](https://github.com/lwhb/lawhub-tool), [lwhb.github.io](https://github.com/lwhb/lwhb.github.io)

### PyCharm (IntelliJ)
1. open lawhub-dev
1. File -> Project Structure -> Project SDK and select Pipfile as Python interpreter
1. File -> Project Structure -> Modules and import repositories for development: lawhub-spider, lawhub-tools and lwhb.github.io