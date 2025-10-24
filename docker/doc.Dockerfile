FROM squidfunk/mkdocs-material:9

COPY ./docs/requirements.txt /docs/
RUN pip install \
    --no-cache-dir \
    --requirement ./requirements.txt

ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000", "--livereload"]
