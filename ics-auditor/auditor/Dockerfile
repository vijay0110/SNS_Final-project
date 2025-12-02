FROM python:3.10
WORKDIR /app

COPY analyze.py analyze.py
COPY audit_rules.yml audit_rules.yml
COPY sample sample

RUN pip install networkx pyyaml

CMD ["python", "analyze.py"]
