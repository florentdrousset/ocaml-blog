.DEFAULT_GOAL := all

.PHONY: all
all:
	opam exec -- dune build --root .

.PHONY: deps
deps: create_switch ## Install development dependencies
	opam install -y ocamlformat=0.25.1 ocaml-lsp-server
	opam install -y --deps-only --with-test --with-doc .

.PHONY: create_switch
create_switch: ## Create switch and pinned opam repo
	opam switch create . 4.14.1 --no-install --repos pin=git+https://github.com/ocaml/opam-repository#c1fcfbe8369cb5a7cb8d7be63db59856dbd85d19

.PHONY: switch
switch: deps ## Create an opam switch and install development dependencies

.PHONY: lock
lock: ## Generate a lock file
	opam lock -y .

.PHONY: build
build: ## Build the project, including non installable libraries and executables
	opam exec -- dune build --root .

.PHONY: playground
playground:
	make build -C playground

.PHONY: install
install: all ## Install the packages on the system
	opam exec -- dune install --root .

.PHONY: start
start: all ## Run the produced executable
		opam exec -- dune exec _build/default/bin/main.exe

