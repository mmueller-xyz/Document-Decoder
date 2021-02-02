.phony: build start

build:
	docker build -t mmueller:document-decoder .

run:
	docker run -d --restart unless-stopped -p 50713:5000 -v /tmp/decoded-docs:/files --name=document-decoder mmueller:document-decoder

start:
	docker start document-decoder

all: build run