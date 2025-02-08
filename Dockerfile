# Base image olarak Node.js kullan
FROM node:18

# Çalışma dizinini ayarla
WORKDIR /app

# Paket yöneticisi ve bağımlılıkları yükle
COPY package.json package-lock.json ./
RUN npm install

# TypeScript ve nodemon gibi geliştirme araçlarını yükle
COPY tsconfig.json ./
RUN npm install -g typescript nodemon

# Bash scriptini ve diğer dosyaları kopyala
COPY bashscript_npm_install.sh ./

# Bash scriptine çalıştırma izni ver
RUN chmod +x bashscript_npm_install.sh

# Bash scriptini çalıştır
#RUN ./bashscript_npm_install.sh


# Uygulama kodlarını kopyala
COPY . .

# TypeScript kodlarını derle
RUN tsc

# Portu aç
EXPOSE 1111

# Uygulamayı başlat
CMD ["node", "./dist/server.js"]
