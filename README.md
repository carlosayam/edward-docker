# edward-docker
Use Edward from within Jupyter notebook interface, launched in parallel with Tensorboard

[Edward](http://edwardlib.org) is a Python library for probabilistic modeling, inference, and criticism. It relies on [TensorFlow](https://www.tensorflow.org) and this Dockerfile provides a quick way to get you started using Docker.

## Steps

1. Install [Docker](https://docs.docker.com/engine/installation/)
2. Clone this repo
```
git clone https://github.com/carlosayam/edward-docker.git
```
3. cd into folder and build `edward-nb` image
```
cd edward-docker
docker built -t edward-nb .
```
4. launch using ./run
```
./run
```
5. Open your browser at [Jupyter](http://localhost:8888/) and/or [Tensorboard](http://localhost:6006)

## Notes

* Use `jupyter_notebook_config.py` to further customise your environment.
* Run command mounts current folder as volume inside your image at `/home/scientist/files`.
* `run-server` is the bash command used internally to launch both, Jupyter server and Tensorboard.
