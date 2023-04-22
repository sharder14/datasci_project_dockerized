FROM python

WORKDIR /src

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

CMD ["jupyter-lab", "--ip","0.0.0.0", "--no-browser", "--allow-root"]