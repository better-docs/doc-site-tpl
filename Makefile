# ANTORA_IMAGE = docker.io/antora/antora:latest
ANTORA_IMAGE = local/antora-custom:testing

doc: doc-clean
	podman run -v ${PWD}/../:/antora:Z --rm -t $(ANTORA_IMAGE) antora-site/antora-playbook-local.yml --clean

doc-serve:
	python3 -m http.server --directory dist --bind 127.0.0.1

doc-clean:
	rm -rf dist

ghpages:
	# If the playbook contains protexted repositories then
	# set the credentials in the gh workflow (GIT_CREDENTIALS)
	# https://docs.antora.org/antora/3.0/playbook/private-repository-auth/
	echo "GIT_CREDENTIALS := ${GIT_CREDENTIALS}"
	npx --no-install antora --fetch antora-playbook.yml
