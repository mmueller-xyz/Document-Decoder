.phony: build start run stop

PORT=50713
FILEPATH="/tmp/decoded-docs"
NAME="document-decoder"
IMAGE_NAME="mmueller:document-decoder"

build:
	docker build -t ${IMAGE_NAME} .

run:
	docker run -d --restart unless-stopped -p ${PORT}:5000 -v ${FILEPATH}:/files --name=${NAME} ${IMAGE_NAME}

start:
	docker start ${NAME}

stop:
	docker stop ${NAME}

all: build run