# Tensorflow serving setup for Docker
Tensorflow serving setup to deploy Tensorflow models as a docker image.

# Usage
Put your Tensorflow models in the models directory (delete the dummy model) in the following structure
```
/models/yourmodel/0/assets/
/models/yourmodel/0/variables
/models/yourmodel/0/keras_metadata.pb
/models/yourmodel/0/saved_model.pb
```
0 is the current version of your model, you can add multiple versions of one model.

Then edit the config/models.config to
```javascript
model_config_list: {
  config: {
     name: "yourmodel",
     base_path: "/models/yourmodel",
     model_platform: "tensorflow"
  }
  ... // other models
}
```

As last step, change the docker image name in the Dockerfile then run ```sh build.sh```.

To start the docker container simply run ```bash docker run --rm -p 8051:8051 image-name-you-chose```

# Accessing neural networks
You can access your deployed models over gRPC or a REST-api.

Create a POST-Request with
```javascript 
{"instances": input_data}
```

as request body to the following endpoints.
## Endpoint (without version)
```/v1/models/yourmodel:predict```

## Endpoint (with specific version)
```/v1/models/yourmodel/versions/<version number>:predict```

# Resources
Checkout https://www.tensorflow.org/tfx/serving/serving_config for more information and documentation.


