FROM node:alpine

WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install

ENV NODE_ENV=production
COPY . .
RUN npm run build

ENV HOST=0.0.0.0

EXPOSE 3000
CMD ["npm", "start"]
