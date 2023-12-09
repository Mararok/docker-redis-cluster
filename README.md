# Docker Testing Redis Cluster  
*DANGER*: Use only for testing purpose in local or CI.

This Docker image allows you to run a Redis in **one node cluster mode** for integration testing. Redis Cluster is a distributed implementation of the Redis database, providing high availability and scalability.

## Running the Container

Image is hosted on Docker hub: `mararok/test-redis-cluster` and redis version is tag name.

To run the Redis Cluster using Docker Compose, create a `docker-compose.yml` file and add the following configuration:

```yaml
version: '3.6'
services:
  redis:
    image: mararok/test-redis-cluster:7.2
    container_name: test-redis
    restart: always
    environment:
      - REDIS_CLUSTER_ANNOUNCE_PORT=20000
    ports:
      - 20000:6379
    volumes:
      - ./tmp/redis:/bitnami/redis/data
```

### Running the Cluster

1. Navigate to the directory containing your `docker-compose.yml` file.
2. Run the following command in your terminal:

```bash
docker-compose up
```

## Default ACL Configuration

The image includes acl file `/bitnami/redis/config/users.acl` that grants access to a user named `app` with access to keys prefixed with `app`. Password to cli and app user is `testredis`

### Accessing the Cluster

You can access the Redis Cluster using the Redis CLI or any Redis client by connecting to the host machine's IP address and the mapped port numbers.

```bash
docker compose exec redis redis-cli -a testredis info
```

## Additional Notes

- Image is based on Bitnami redis cluster: [Docker Hub](https://hub.docker.com/r/bitnami/redis-cluster)
- For more advanced configuration or customization, refer to the [Redis documentation](https://redis.io/topics/cluster-tutorial).
- Ensure that your host machine meets the necessary system requirements for running Docker containers.


## Developer Notes
Building the Image
Developers can build the Redis Cluster image using make by specifying the Redis version:

```bash
make build REDIS_VERSION=7.2
```

This command will build the Docker image with the specified Redis version.

```bash
make push REDIS_VERSION=7.2
```

This command will build and push the docker image with the specified Redis version to Docker Hub.