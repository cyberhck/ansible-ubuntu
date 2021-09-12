sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
sudo pip install --upgrade psutil
echo "You'll need to provide a github PAT to save ssh key, a link will be opened (click the following link if that didn't work)"
echo "https://github.com/settings/tokens/new?description=ansible%20setup%20token&scopes=admin:gpg_key,admin:public_key"
xdg-open "https://github.com/settings/tokens/new?description=ansible%20setup%20token&scopes=admin:gpg_key,admin:public_key" || true
echo "Change the expiry to 7 days and simply create the token, copy it and input below:"
echo -n "github Personal Access Token (with ssh keys scope):"
read -s password

ansible-galaxy install -r requirements.yaml

ansible-playbook main.yml --ask-become-pass --extra-vars "GH_TOKEN=$password"
echo "delete the token you generated if you're done using the playbook for now"
echo "https://github.com/settings/tokens"
xdg-open "https://github.com/settings/tokens" || true
