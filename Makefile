fmt:
	bash scripts/format.bash
.PHONY: fmt

fmt-check:
	shfmt --language-dialect bash --diff bin/* lib/* scripts/*
.PHONY: fmt-check

lint:
	bash scripts/lint.bash
.PHONY: lint

test:
	bats test
.PHONY: test
