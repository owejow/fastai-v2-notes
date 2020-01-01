SRC = $(wildcard nbs/*.ipynb)

all: fastai_v2_notes docs

fastai_v2_notes: $(SRC)
	nbdev_build_lib
	touch fastai_v2_notes

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist