# setup.py
from pathlib import Path

from setuptools import find_namespace_packages, setup

# Load packages from requirements.txt
BASE_DIR = Path(__file__).parent
with open(Path(BASE_DIR, "requirements.txt"), "r") as file:
    required_packages = [ln.strip() for ln in file.readlines()]

style_packages = ["black==22.3.0", "pylint", "isort==5.10.1"]

test_packages = ["pytest", "pytest-cov"]
# setup.py
setup(
    name="app",
    version=0.1,
    description="Simple ML project",
    author="David Amoateng",
    author_email="david.eliiza.com.au",
    url="https://eliiza.com.au/",
    python_requires=">=3.8",
    install_requires=[required_packages],
    py_modules=[],
    extras_require={"dev": test_packages + style_packages},
)
