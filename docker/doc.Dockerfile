FROM python:3

# Create app directory
WORKDIR /usr/src/app

RUN pip install \
    mkdocs \
    mkdocs-pdf-export-plugin \
    mkdocs-material

COPY . .

# RUN mkdocs build

EXPOSE 8000
# CMD ["python", "-m", "http.server", "8000", "-d", "./site"]
CMD ["mkdocs" "serve" "--clean"]
