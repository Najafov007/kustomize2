# Имя вашего виртуального окружения
VENV := venv

# Убедитесь, что все команды используют правильную среду
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

.PHONY: all install test clean

all: install

$(VENV):
	python3 -m venv $(VENV)

$(VENV)/bin/activate: $(VENV) requirements.txt
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	touch $(VENV)/bin/activate

install: $(VENV)/bin/activate

test: install
	$(VENV)/bin/pytest

clean:
	rm -rf $(VENV)
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete

