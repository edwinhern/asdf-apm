fmt:
	bash scripts/format.bash
.PHONY: fmt

lint:
	bash scripts/lint.bash
.PHONY: lint

test:
	bats test
.PHONY: test
