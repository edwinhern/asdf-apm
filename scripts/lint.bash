#!/usr/bin/env bash

shellcheck --shell=bash --external-sources \
	--source-path=SCRIPTDIR \
	bin/* \
	lib/* \
	scripts/*

shfmt --language-dialect bash --diff \
	bin/* lib/* scripts/*
