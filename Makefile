.phony: build start

build:
	docker build -t mmueller:document-decoder .

run:
	docker run -p 5000:5000 -v /tmp/decoded-docs:/files --name=document-decoder mmueller:document-decoder

all: build run