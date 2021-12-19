# ANTORA_IMAGE = docker.io/antora/antora:latest
ANTORA_IMAGE = local/antora-custom:testing

doc: doc-clean
	podman run -v ${PWD}/../:/antora:Z --rm -t $(ANTORA_IMAGE) antora-site/antora-playbook-local.yml --clean

doc-serve:
	python3 -m http.server --directory dist --bind 127.0.0.1

doc-clean:
	rm -rf dist
