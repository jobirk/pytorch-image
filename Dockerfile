# Docker image for ML with pytorch based on the official pytorch image

FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

RUN apt-get update && apt-get install -y vim

COPY requirements.txt .

RUN pip install -r requirements.txt
