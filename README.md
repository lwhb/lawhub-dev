Master repository to manage LawHub project development environment

## Prerequisites
* pyenv
* pipenv

## Setup
```
mkdir lawhub && cd lawhub
git clone https://github.com/lwhb/lawhub-dev.git
```
You can use a different root directory name instead of lawhub if you want.

### Environment variables
```
echo "export LAWHUB_ROOT=$PWD" >> ~/.bash_profile
echo "export LAWHUB_DATA=$PWD/data" >> ~/.bash_profile
```
You can use a diffrent a directory for LAWHUB_DATA, under which crawled/processed data will be stored.

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
