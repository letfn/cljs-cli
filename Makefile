main: target/main.js
	true

clean:
	rm -rf target .shadow-cljs node_modules main

install:
	npm install

release: ./node_modules/.bin/shadow-cljs
	./node_modules/.bin/shadow-cljs release app

node_modules/.bin/shadow-cljs:
	$(MAKE) install

target/main.js:
	$(MAKE) release
