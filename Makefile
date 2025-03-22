deps:
	pip install -r requirements; 
	pip install -r test requirements; 
lint:
	flake8 hello_world test
run:
	python main.py
.PHONY: test
test:
	PYTHONPATH=. py.test --verbose -s