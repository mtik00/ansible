# Setup

## Initial install

You must configure your system if this is the first time you've run `ansible` on a system.

### SSH Key
```shell
mkdir --mode 700 -p ~/.ssh && \
ssh-keygen -t ecdsa -b 521 -N '' -f ~/.ssh/gpx1
```

Add the public key to your GitHub account:  
https://github.com/settings/keys

### Clone

You'll need to set up the environment

```shell
sudo apt-get update && \
sudo apt-get install --upgrade git && \
mkdir -p ~/code && \
cd ~/code && \
git clone git@github.com:mtik00/ansible.git
```

## python

You might have to install this before direnv will work
```
sudo apt install python3.10-venv
```

## direnv

Install `direnv`: https://direnv.net/docs/installation.html#from-binary-builds
```
curl -sfL https://direnv.net/install.sh | bash
eval "$(direnv hook bash)"
```

Ensure you have an activated virtual environment, and then run:

```shell
python -m ensurepip && \
python -m pip install --upgrade pip ansible black
mkdir -m 0700 -p ./.secrets \
  && touch ./.secrets/{ansible-vault,env.sh} \
  && find ./.secrets -type f -name "*" -exec chmod 600 {} \;
```

## ansible-vault setup

Find the vault password and put it in `./.secrets/ansible-vault`

Create the ansible sudo password file:
```
ansible-vault create .secrets/vars.yml
```

with content like this:
```
ansible_become_password: XXXX
git_email: me@example.com
git_name: Jane Doe
git_signing_key: XXXX
```

# Running

```
ansible-playbook playbook.yml
```
