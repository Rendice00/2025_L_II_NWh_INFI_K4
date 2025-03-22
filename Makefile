deps:
	pip install -r requirements. txt; 
	pip install -r test requirements. 
lint:
	flake8 hello world test 
run:
	python main.py
.PHONY: test
test:
	PYTHONPATH=. py.test --verbose -s