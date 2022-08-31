FROM tensorflow/serving:2.7.3

COPY models models
COPY config config

EXPOSE 8500
EXPOSE 8501

CMD ["--model_config_file=/config/models.config"]
