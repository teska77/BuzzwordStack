FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY buzzword_stack_backend/ /code/
RUN pip install -r requirements.txt
EXPOSE 8000
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]