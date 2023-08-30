# Docker image for ML with pytorch based on the official pytorch image

FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

RUN apt-get update && apt-get install -y vim wget curl git

# allow pip install of "sklearn", which should be replaced by "scikit-learn"
# (if this is not used, the github CI pipeline fails from time to time)
ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True

COPY requirements.txt .

RUN pip install -r requirements.txt

SHELL ["/bin/bash", "--login", "-c"]

RUN conda install -y jupyter

# move anaconda binary path to the end, otherwise the "clear" command in the terminal
# is broken
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/anaconda/bin

# activate conda environment by default
RUN ["/bin/bash", "-c", "source /opt/conda/bin/activate"]
