FROM node:16.13.0

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  ffmpeg \
  wget \
  chromium \ 
  imagemagick && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .
RUN npm install -g npm@latest
RUN npm install 
RUN npm install @adiwajshing/baileys@latest
RUN npm instal pm2 -g
ENV PM2_PUBLIC_KEY smfthykaakt6csh
ENV PM2_SECRET_KEY 3qpih5cm30gqrmt
COPY . .
EXPOSE 5000

CMD ["pm2-runtime", "index.js"]
