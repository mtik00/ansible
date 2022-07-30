# Setup

Install `direnv`: https://direnv.net/docs/installation.html#from-binary-builds

Ensure you have an activated virtual environment.

Run these in `bash`
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

# TODO:
  - gnupg
