lawhubプロジェクトの開発環境を管理するマスターレポジトリ

## Requirements
* pyenv
* pipenv

## Setup
```
mkdir lawhub && cd lawhub  # you can use different parent directory name if you want
git clone https://github.com/lwhb/lawhub-dev.git
```

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

### PyCharm (IntelliJ)
1. open lawhub-dev
1. File -> Project Structure -> Project SDK and set Pipfile as Python interpreter
1. File -> Project Structure -> Modules and import lawhub-spider and lawhub-tools