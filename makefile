.PHONY: install test run docker-build docker-run docker-test clean

IMAGE_NAME := data-engineering-demo


# Install dependencies
install:
	python -m pip install -r requirements.txt


# Run tests
test:
	python -m pytest -q


# Run the application
run:
	python src/main.py


# Build the Docker image
docker-build:
	docker build -t $(IMAGE_NAME) .


# Run the application inside Docker
docker-run:
	docker run -it --rm $(IMAGE_NAME)


# Run tests inside Docker
docker-test:
	docker run --rm $(IMAGE_NAME) python -m pytest -q


# Remove generated files and caches
clean:
	rm -rf .pytest_cache
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete