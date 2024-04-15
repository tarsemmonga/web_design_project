FROM python:3.5
RUN pip install gunicorn flask
EXPOSE 80
COPY ./app /app
RUN pip install -r requirements.txt
CMD ["gunicorn", "-b", ":80", "app:app"]