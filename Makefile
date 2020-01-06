
ROOT := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

build:
	#docker run --rm -it --volume="$(ROOT):/srv/jekyll" jekyll/jekyll:3.8 jekyll build
	jekyll build

test: build
	jekyll doctor
	docker run --rm -v $(ROOT)_site:/site 18fgsa/html-proofer /site \
		--disable_external \
		--check-html \
		--check-opengraph \
		--check-sri

.PHONY: build test
