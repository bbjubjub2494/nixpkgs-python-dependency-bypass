from setuptools import find_packages, setup

dependencies = [
    "blspy==2.0.2",  # Signature library
]

kwargs = dict(
    name="something",
    author="Julie Bettens",
    author_email="julie@bettens.info",
    description="test",
    python_requires=">=3.8.1, <4",
    install_requires=dependencies,
    packages=["something"],
)
setup(**kwargs)
