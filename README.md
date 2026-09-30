# myecs-frontend

React + Vite single-page app, built into static files and served by nginx on port 80. nginx also proxies `/api/` requests to the backend. Frontend tier of a three-tier app running on AWS ECS Fargate — infrastructure lives in `aws_ecs_infra`.

## Build

Multi-stage Dockerfile: stage 1 (`node`) runs `npm run build`, stage 2 (`nginx`) serves `/app/dist`.

`VITE_API_URL` is a **build-time** argument. Leave it empty so the app calls relative `/api/...` paths and nginx forwards them to the backend.

```bash
docker build -t myecs-frontend .
docker run --rm -p 3000:80 myecs-frontend
```
