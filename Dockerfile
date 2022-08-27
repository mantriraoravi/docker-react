from node:16-alpine as builder
WORKDIR '/app'
copy package.json .
run npm install
copy . .
run npm run build

from nginx
EXPOSE 80
copy  --from=builder     /app/build /usr/share/ngnix/html