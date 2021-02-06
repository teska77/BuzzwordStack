FROM python:3

ENV PYTHONUNBUFFERED=1
ENV PATH "$PATH:/root/.local/bin"

COPY api/ /code/
WORKDIR /code/src
RUN ./setup-docker.sh

EXPOSE 5000

CMD ["/bin/bash", "-c", "./run.sh"]
# CMD ["python", "-m", "http.server", "5000"]