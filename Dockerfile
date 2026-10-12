# Stage 1 - Build React App
FROM node:22-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

ARG VITE_API_URL

ENV VITE_API_URL=$VITE_API_URL

RUN npm run build

# Stage 2 - Serve Static Build With Nginx
FROM nginx:1.30-alpine

# Pull in Alpine security fixes released since the nginx image was last rebuilt (Trivy gate in CI)
RUN apk upgrade --no-cache

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
