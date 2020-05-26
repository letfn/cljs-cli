SHELL := /bin/bash

.PHONY:

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

main: target/main.js # Compile release
	true

clean:
	rm -rf target .shadow-cljs node_modules main

install:
	npm install

watch:
	./node_modules/.bin/shadow-cljs watch app

repl:
	./node_modules/.bin/shadow-cljs cljs-repl app

release: ./node_modules/.bin/shadow-cljs
	./node_modules/.bin/shadow-cljs release app

node_modules/.bin/shadow-cljs:
	$(MAKE) install

target/main.js:
	$(MAKE) release
