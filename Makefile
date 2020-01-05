
ROOT := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

all: build test

build:
	jekyll build

test: build
	jekyll doctor
	docker run --rm -v $(ROOT)_site:/site 18fgsa/html-proofer /site \
		--disable_external \
		--check-html \
		--check-opengraph \
		--check-sri

.PHONY: all build test
