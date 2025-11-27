# PyTorch

PyTorch is a deep learning library written in C++ and wrapped in Python.
It uses a lots of tools and libraries for hardware acceleration and running Deep Learning models on GPU or other accelerators.

In container we are installing dependencies for PyTorch.

We are not building PyTorch from the container is because we are actively contribute to PyTorch and test everything by building with different options and turning different thing on and off. This makes it practically useless for us to write a mature script to build PyTorch with right options.

## Explain script
Install build dependencies for pytorch,
install miniconda
activate and accept terms and conditions of miniconda
create a new conda environment for pytorch
create a new venv virtual environment to install pytorch in that environment.
clone the repository in the desired path if does not exist.

Now get all the git submodules and install the dependencies

After that you are ready to build pytorch with different build options, either in -noisolation-build or directly installing with `python3 setup.py develop`.

## Build options
Most of the build options are already mentioned in setup.py file in the main directory of pytorch.
