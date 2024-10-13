# install node
FROM node:16-alpine AS builder

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

# stage two 
FROM nginx:stable-alpine

WORKDIR /app

# Copy the build folder from the first stage
COPY --from=builder /app/build /usr/share/nginx/html


# Expose port 80
EXPOSE 80

# serve the build 
CMD ["nginx", "-g", "daemon off;"]
