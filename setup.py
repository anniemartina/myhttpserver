from setuptools import setup

def get_requires_from_file(requires_file):
    """
    Get requirements from file
    """
    with open(requires_file, encoding='utf-8') as filed:
        return [line for line in filed.readlines() if not line.startswith('#')]

setup(
    author="AnnieMartinaTheophilus",
    author_email="ann.jesey@gmail.com",
    description="This package provides trdl package",
    install_requires=get_requires_from_file("requirements.in"),
    name="trdl",
    py_modules=["trdl"],
    version="0.0.1",
)
