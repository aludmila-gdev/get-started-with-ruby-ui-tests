clear-environment:
	docker system prune -a

build-docker:
	docker build -t ruby-ui-test .

compose-docker:
	docker compose up ruby-ui-test

run-tests: compose-docker
