deps:
	pip install -r requirements.txt;
	pip install -r test_requirements.txt
lint:
	flake8 hello_world test
run:
	python main.py
.PHONY: test
test:
	PYTHONPATH=. py.test --verbose -s
docker_build:
	docker build -t hello-world .
docker_run: docker_build
	docker run
	--name hello-world-printer-dev
	-p 5000:5000
	-d hello-world
USERNAME=rendice00
TAG=$(USERNAME)/hello-world
docker_push: docker_build
	@docker login --username $(USERNAME) --password ${DOCKER_PASSWORD}; \
	docker tag hello-world $(TAG); \
	docker push $(TAG); \
	docker logout;
