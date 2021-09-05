FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx

# after name of the image(here it is builder) give name of folder to copy from follwed by nginx location command
COPY --from=builder /app/build /usr/share/ngimx/html
