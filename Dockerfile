FROM tensorflow/serving:2.7.3

COPY models models
COPY config config

EXPOSE 8050
EXPOSE 8051

CMD ["--model_config_file=/config/models.config"]