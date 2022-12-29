FROM node:alpine

COPY . .

RUN npm ci

EXPOSE 3000

CMD ["npx", "pm2-runtime", "main.js"]