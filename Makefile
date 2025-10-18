.PHONY: all

cicd_build:
	./cicd/build.sh

cicd_unit_test:
	./cicd/unit_test.sh

cicd_deliver:
	./cicd/deliver.sh

cicd_deploy:
	./cicd/deploy.sh
