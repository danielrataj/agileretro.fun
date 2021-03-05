
## Install the dependencies

```bash
yarn
```

\### Local configuration

Create a `.quasar.env.json` file in the root of the directory. This file contains environmental variables for local development. You can check the example file - [.quasar.env.json.example](/.quasar.env.json.example)
All environmental variables should be taken from docker-compose.yml file as well.

### Start the app in development mode (hot-code reloading, error reporting, etc.)

```bash
yarn dev
```

### Lint the files

```bash
yarn run lint
```

### Build the app for production

Build is handled in [Dockerfile](./Dockerfile) file.

### Generate favicons

```sh
# install dependecy first
yarn global add @quasar/icongenie

# generate
icongenie generate -i public/logo/favicon_1024_1024.png --skip-trim -m spa
```

## Docker

### Build

```sh
docker build -t agileretrofun .
```

## Run image

```sh
docker run -p 8080:8080 agileretrofun
```
