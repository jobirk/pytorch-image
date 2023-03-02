# Docker image for ML with pytorch based on the official anaconda image

FROM continuumio/anaconda3

COPY environment.yml .

RUN conda env create -f environment.yml
