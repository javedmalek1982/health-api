# Stage 1: Install dependencies
FROM node:22-alpine AS build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --only=production

# Stage 2: Production image
FROM node:22-alpine AS production
WORKDIR /app


LABEL org.opencontainers.image.source="https://github.com/your-javedmalek1982/health-api"
LABEL org.opencontainers.image.description="A health check API with automated container publishing"
LABEL org.opencontainers.image.licenses="ISC"


COPY --from=build /app/node_modules ./node_modules
COPY src ./src
COPY package.json ./

EXPOSE 3000

USER node

CMD ["node", "src/server.js"]

