# Docker image for ML with pytorch based on the official pytorch image

FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

RUN apt-get update && apt-get install -y vim wget curl

COPY requirements.txt .

RUN pip install -r requirements.txt

# move anaconda binary path to the end, otherwise the "clear" command in the terminal
# is broken
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/anaconda/bin
ENV TEST=dummy
RUN touch dummy.txt
