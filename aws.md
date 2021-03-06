# AWS setup

## Instance
Provisioned (1GB RAM, 1vCPU, 40GB Storage) instance from Amazon Lightsail with Amazon Linux OS. Note that the minimum 512MB RAM instance found out to throw MemoryError when crawling e-Gov data.

## Basics 
```
sudo yum install git tmux htop
sudo ln -sf /usr/share/zoneinfo/Japan /etc/localtime
```

## Pip
```
sudo yum install python37
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
```
https://docs.aws.amazon.com/ja_jp/elasticbeanstalk/latest/dg/eb-cli3-install-linux.html

## pipenv
```
pip install --user pipenv
```

## pyenv
First needed to install build dependencies listed in [common-build-problems](https://github.com/pyenv/pyenv/wiki/common-build-problems]):
```
sudo yum install @development zlib-devel bzip2 bzip2-devel readline-devel sqlite \
sqlite-devel openssl-devel xz xz-devel libffi-devel findutils
```

And followed basic installation guide in [README.md](https://github.com/pyenv/pyenv/):
```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
```

## github
Followed [github wiki](https://help.github.com/ja/github/authenticating-to-github/connecting-to-github-with-ssh) and registered SSH key as lwhb.
```
ssh-keygen -t rsa -b 4096 -C "lawhub.tokyo@gmail.com"

git config --global user.name lwhb
git config --global user.email lawhub.tokyo@gmail.com
```

## lawhub
Followed [README.md](./README.md). Use SSH in init.sh instead.

## cron
Configured daily cron job as follows by `crontab -e`:
```
0 0 * * * /home/ec2-user/lawhub/lawhub-tool/cron_daily.sh &> /home/ec2-user/lawhub/data/log/cron_daily.log
```

## CloudWatch
Set up CloudWatchAgent to send logs from CloudWatch

```
wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo rpm -U ./amazon-cloudwatch-agent.rpm

# set IAM credentials with CloudWatchAgentServerPolicy
sudo vi /opt/aws/amazon-cloudwatch-agent/etc/common-config.toml

# configure log files to send
sudo vi /opt/aws/amazon-cloudwatch-agent/bin/config.json

# activate CloudWatchAgent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

# check CloudWatchAgent log
less -S /var/log/amazon/amazon-cloudwatch-agent/amazon-cloudwatch-agent.log
```

* https://docs.aws.amazon.com/ja_jp/AmazonCloudWatch/latest/monitoring/installing-cloudwatch-agent-commandline.html
* https://blog.asterism.xyz/posts/2019-07-25/
* https://blog.d-shimizu.io/article/1836

## Others
* How to add new user?
    * https://aws.amazon.com/jp/premiumsupport/knowledge-center/new-user-accounts-linux-instance/
* How to open new port?
    * add a new firewall rule: (custom, TCP, 4000)