lawhubプロジェクトの開発環境を管理するマスターレポジトリ

## Requirements
* pyenv
* pipenv

## Setup

### Python
```
pipenv install 
pipenv shell
```

### Repositories
```
./init.sh
```

### PyCharm (IntelliJ)
1. open lawhub-dev
1. use Pipfile in lawhub-dev as Python interpreter
1. mark lawhub-spider and lawhub-tool as Sources Root
1. mark lawhub-tool/tests as Test Sources Root and configure test working directory as lawhub-tool/tests