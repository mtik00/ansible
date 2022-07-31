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
git clonegit@github.com:mtik00/ansible.git
```

## direnv

Install `direnv`: https://direnv.net/docs/installation.html#from-binary-builds

Ensure you have an activated virtual environment, and then run:

```shell
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
```

# Running

```
ansible-playbook playbook.yml
```
