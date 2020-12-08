
DEMO_STEM=edgerealtimevideoanalytics
SPEC=docker-compose.local.yaml

start-edge:
	@docker run --rm --name edge --network host -it --gpus all $(DEMO_STEM)_redisedge:latest

start:
	@docker-compose -f $(SPEC) up

start-all:
	@docker run --rm -d --name edge --network host -it --gpus all $(DEMO_STEM)_redisedge:latest
	@docker-compose -f $(SPEC) up -d

stop-all:
	@docker-compose -f $(SPEC) down
	@docker stop edge

logs:
	@docker logs edge

build:
	@docker-compose -f $(SPEC) build

setup:
	@$(SUDO) ./sbin/getcompose

.PHONY: start-edge start start-all stop stop-all logs build setup
