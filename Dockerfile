# Docker image for ML with pytorch based on the official pytorch image

FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

RUN apt-get update && apt-get install -y vim wget curl git

COPY requirements.txt requirements_cnf.txt .

RUN pip install -r requirements.txt
RUN pip install -r requirements_cnf.txt

SHELL ["/bin/bash", "--login", "-c"]

RUN conda install -y jupyter

# move anaconda binary path to the end, otherwise the "clear" command in the terminal
# is broken
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/anaconda/bin

# activate conda environment by default
RUN ["/bin/bash", "-c", "source /opt/conda/bin/activate"]
