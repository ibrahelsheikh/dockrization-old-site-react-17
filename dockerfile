# install node
FROM node:16-alpine

# create app directory in container
WORKDIR /app

# copy package.json file from current directory to app directory in container 
COPY package.json .

# install all dependencies
RUN npm install 

# copy all file from current directory to app directory in container
COPY . .

# build the app
RUN npm run build

# expose port 3000
EXPOSE 3000

# run the app from build folder
CMD ["npx", "serve", "-s", "build", "-l", "3000"]
