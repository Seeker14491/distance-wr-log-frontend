FROM node:17 AS builder
WORKDIR /src
COPY . .

ARG PUBLIC_URL=/
RUN yarn && yarn parcel build --public-url $PUBLIC_URL --out-dir /out www/index.html


FROM caddy:2
COPY --from=builder /out /srv