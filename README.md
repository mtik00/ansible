# Setup

Install `direnv`: https://direnv.net/docs/installation.html#from-binary-builds

Ensure you have an activated virtual environment.

Run these in `bash`
```shell
python -m pip install --upgrade pip ansible black
mkdir -p ./.secrets \
  && touch ./.secrets/{ansible-vault,env.sh} \
  && chmod 700 ./.secrets \
  && find ./.secrets -type f -name "*" -exec chmod 600 {} \;
```

## ansible-vault setup

Find the vault password and put it in `./.secrets/ansible-vault`

# Running

```
ansible-playbook playbook.yml
```
