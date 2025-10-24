.PHONY: all clean test setup_local cicd_build

.EXPORT_ALL_VARIABLES:
RELEASE_NAME = $(shell cat RELEASE)

setup_local:
	gh auth token | docker login ghcr.io --username jpbarto --password-stdin

cicd_build:
	./cicd/build.sh

cicd_unit_test:
	./cicd/unit_test.sh

cicd_deliver_snapshot:
	RELEASE_NAME=$$RELEASE_NAME-snapshot \
	./cicd/deliver.sh

cicd_deliver:
	./cicd/deliver.sh

cicd_deploy:
	./cicd/deploy.sh
