FROM node:20

WORKDIR /app

COPY yarn.lock package.json ./

RUN yarn install

COPY . .

RUN yarn build

EXPOSE 3000

ENV NODE_ENV=development

# Command to run the app based on NODE_ENV (production vs development)
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = 'production' ]; then yarn preview; else yarn dev; fi"]