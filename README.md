# FakeIt Docker

--

This is a docker container with Node and [FakeIt](https://github.com/bentonam/fakeit) pre-installed.  When the container is ran, it will execute your `fakeit` command and then exit.

Be sure to use the `--rm` flag to remove the container after it exits.  Additionally, the `--volumes` argument is required.  This will virtually link you're models into the container so they can be processed by  [FakeIt](https://github.com/bentonam/fakeit).

### Output to Console

```bash
docker run \
  --rm \
  --volume $PWD/models:/data \
  bentonam/fakeit \
  fakeit console \
  --count 10 \
  /data/users.yaml
```

These commands do the same thing, you can optionally specify fakeit as part of the command you're passing to the container but it is not required.

```bash
docker run \
  --rm \
  --volume $PWD/models:/data \
  bentonam/fakeit \
  fakeit console --count 10 /data/users.yaml
```

--

### Output to Couchbase cluster

```bash
docker run \
  --rm \
  --volume $PWD/models:/data \
  bentonam/fakeit \
  couchbase \
  --server example-couchbase \
  --bucket example \
  --username Administrator \
  --password password \
  --use-streams true \
  --high-water-mark 512 \
  --verbose \
  --count 10000 \
  /data/users.yaml
```
