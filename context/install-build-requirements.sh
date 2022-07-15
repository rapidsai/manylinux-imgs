#!/usr/bin/env sh

# a hacky script that exists to be able to run any `python setup.py` target
# while obeying pyproject.toml by parsing and installing with pip directly

set -e

# cibuildwheel will interpolate {package} and pass it here as an argument
if [ -z "$1" ]; then
  echo "Must run with argument: /path/to/python/package" >&2
  exit 1
fi

PROJECT_DIR="$1"

python3 -m pip install toml twine

build_system_requires=$(python3 -c "import toml; print(\" \".join(toml.load(\"${PROJECT_DIR}/pyproject.toml\")[\"build-system\"][\"requires\"]))")

python3 -m pip install ${build_system_requires}
