# learn-ecs-frontend

Clean React + Vite frontend for ECS demo.

## Environment

Only one app-level environment variable is required:

```text
VITE_API_URL=http://localhost:8000
```

For ECS:

```text
VITE_API_URL=http://learn-ecs-backend.ecs.local:8000
```

## Local Run

```bash
npm install
npm run dev
```

Open:

```text
http://localhost:5173
```

## Docker Compose Run

```bash
docker compose up --build
```

Open:

```text
http://localhost:3000
```

## Docker Build For ECS

```bash
docker build \
  --build-arg VITE_API_URL=http://learn-ecs-backend.ecs.local:8000 \
  -t learn-ecs-frontend .
```

## ECS Container Port

```text
80
```

## Notes

This repo does NOT use:

```text
docker-entrypoint.sh
config.js
nginx API proxy
fake frontend env variables
```

The app uses:

```js
import.meta.env.VITE_API_URL
```
