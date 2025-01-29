
#!/bin/bash

# Shebang (#!/): Betiğin Bash kabuğu ile çalışacağını gösterir.
# bin/bash: names
# İşletim sistemine Bash betiğinin çalışacağını söyler

echo -e "\e[34m Kurulumlar\e[0m"

# User Variables
INFORMATION="Bilgi"
NPM_SAVE="Npm Save Loading..."
NPM_SAVE_DEV="Npm Save Dev Loading..."
NPM_GLOBAL="Npm Global Loading..."
PACKAGE="Package Common File"
NPM_UPDATE="Npm Update"
NPM_COMPILER="Npm Compiler"
TYPESCRIPT="Typescript Install"
PACKAGE_JSON="package.json"
SERVER_START="server start lite-server"

###################################################
# Color
# red=$(tput setaf 1)
# green=$(tput setaf 2)
# yellow=$(tput setaf 3)
# blue=$(tput setaf 4)
# magenta=$(tput setaf 5)
# cyan=$(tput setaf 6)
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC=='\033[0m' # No Color
###################################################

# ÖNEMLİ NOT: eğer windows üzerinden çalıştırıyorsanız sudo tanımayacaktır.
# ÖNEMLİ NOT: nginx eğer browserda istediğiniz sonuç çıkmazsa browserin cache belleğini temizleyiniz. yoksa nginx'in kendi sayfasını görürüsünüz.
#####################################################################################################
#####################################################################################################
# Bashscriptlere İzin Vermemiz
chmod +x bashscript_countdown.sh
ls -al
code .

#####################################################################################################
#####################################################################################################
# Install
create_empty_files_if_not_exists() {
    # Geriye Say
    ./bashscript_countdown.sh    

    echo -e "\e[36m\n###### ${PACKAGE} ######  \e[0m"
    echo -e "\e[33mGenel Dosyaları Yüklemek İster misiniz ? e/h\e[0m"
    read -p "" packageResult
    if [[ $packageResult == "e" || $packageResult == "E" ]]; then
        echo -e "\e[32mpackage Yüklenmeye başlandı ...\e[0m"

        # Geriye Say
        ./bashscript_countdown.sh    
        # Parametre olarak gelen dosyalar üzerinde işlem yap
        for file in "$@"; do
            if [ ! -f "$file" ]; then
                echo "$file dosyası oluşturuluyor..."
                touch "$file"
                echo "${YELLOW} $file başarıyla oluşturuldu.\n"
            else
                echo -e "$file zaten mevcut, oluşturulmadı.\n"
            fi
        done
    else
        echo -e "${RED}package Yüklenmeye Başlanmadı ....\e[0m"
    fi
}

# Fonksiyon çağrısı
# Örnek olarak tüm dosyalar için çağrı
create_empty_files_if_not_exists Dockerfile docker-compose.yml .gitlab-ci.yml  Readme.md style.css test.py shorting_keyboard.txt

#####################################################################################################
#####################################################################################################
# index.html (Install)
index_html_install() {
    # Geriye Sayım
    ./bashscript_countdown.sh

    echo -e "\e[36m\n###### index.html Kurulumu ######\e[0m"
    echo -e "\e[33mindex.html dosyasını yüklemek ister misiniz? [e/h]\e[0m"
    read -p "" indexResult

    if [[ "$indexResult" == "e" || "$indexResult" == "E" ]]; then
        echo -e "\e[32mindex.html yüklenmeye başlıyor...\e[0m"

        # Geriye Sayım
        ./bashscript_countdown.sh

        # index.html yoksa oluştur
        if [ ! -f "index.html" ]; then
            echo "index.html oluşturuluyor..."
            cat > index.html <<EOL
<!doctype html>
<html lang="en">
    <head>
        <title>Typescript Öğreniyorum</title>

        <!-- for language -->
        <meta charset="utf-8" />

        <!-- for responsive design -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />

        <!-- External Css -->
        <link rel="stylesheet" href="./style.css">
    </head>

    <body>
        <!-- Start Codes -->
        <h1 class="text-primary">Merhabalar Typescript Öğreniyorum</h1>
    
        <p>
            lorem*40
        </p>
    
        <!-- End Codes -->
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>

        <!-- External Js -->
        <script src="./dist/index.js"></script>
    </body>
</html>
EOL
            echo "index.html başarıyla oluşturuldu ve içerik eklendi."
        else
            echo "index.html zaten mevcut, yeniden oluşturulmadı."
        fi

        echo -e "\e[32mindex.html kurulumu tamamlandı!\e[0m"
    else
        echo -e "${RED}index.html kurulumu iptal edildi.\e[0m"
    fi
}

# Fonksiyonu çalıştır
index_html_install

#####################################################################################################
#####################################################################################################
# gitignore_install (Install)
gitignore_install() {
    # Geriye Sayım
    ./bashscript_countdown.sh

    echo -e "\n\e[36m\n###### gitignore Kurulumu ######\e[0m"
    echo -e "\e[33mgitignore yüklemek ister misiniz? [e/h]\e[0m"
    read -p "" gitignore

    if [[ "$gitignore" == "e" || "$gitignore" == "E" ]]; then
        echo -e "\e[32mgitignore yüklenmeye başlıyor...\e[0m"

        # Geriye Sayım
        ./bashscript_countdown.sh


        # index.js yoksa oluştur
        if [ ! -f ".gitignore" ]; then
            echo ".gitignore oluşturuluyor..."
            cat > .gitignore <<EOL
# Special My Git untrackted
/node_modules
EOL
            echo ".gitignore oluşturuldu ve içerik eklendi."
        else
            echo ".gitignore zaten mevcut."
        fi

        echo -e "\e[32m.gitignore kurulumu tamamlandı!\e[0m"
    else
        echo -e "\e[31m.gitignore kurulumu iptal edildi.\e[0m"
    fi
}

# Fonksiyonu çalıştır
gitignore_install

#####################################################################################################
#####################################################################################################
# Install
package_json() {
    # Geriye Say
    ./bashscript_countdown.sh

    echo -e "\n\e[36m\n###### ${PACKAGE_JSON} ######  \e[0m"
    echo -e "\e[33mPackage.json Yüklemek İster misiniz ? e/h\e[0m"
    read -p "" packageJsonResult
    if [[ $packageJsonResult == "e" || $packageJsonResult == "E" ]]; then
        echo -e "\e[32mpackage Json Yüklenmeye başlandı ...\e[0m"

        # Geriye Say
        ./bashscript_countdown.sh

        rm -rf node_modules
        npm init -y 
    else
        echo -e "\e[31mpackage Json Yüklenmeye Başlanmadı ....\e[0m"
    fi
}
package_json

#####################################################################################################
#####################################################################################################
# Local Save (Install)
npm_local_save() {
    # Geriye Say
    ./bashscript_countdown.sh

    echo -e "\n\e[36m\n###### ${NPM_SAVE} ######  \e[0m"
    echo -e "\e[33mNpm Paketlerini Yüklemek İster misiniz ? e/h\e[0m"
    read -p "" npmSaveResult
    if [[ $npmSaveResult == "e" || $npmSaveResult == "E" ]]; then
        echo -e "\e[32mNpm Save Yüklenmeye başlandı ...\e[0m"

        # Geriye Say
        ./bashscript_countdown.sh

        npm list  
        #npm list -g 
        npm root 
        #npm root -g

        # https://www.npmjs.com/
        npm i body-parser compression cors csurf cookie-parser ejs  express express-rate-limit helmet mongodb morgan mongoose swagger-jsdoc swagger-ui-express  winston --save 
        npm list
        npm install
        npm dedupe  # Bağımlılıkların tekrarlanan kopyalarını temizler.
        npm list  

    else
        echo -e "\e[31mNpm Save Yüklenmeye Başlanmadı ....\e[0m"
    fi
}
npm_local_save

#####################################################################################################
#####################################################################################################
# Local Save Dev (Install)
npm_local_dev_sav() {
    # Geriye Say
    ./bashscript_countdown.sh

    echo -e "\n\e[36m\n###### ${NPM_SAVE_DEV} ######  \e[0m"
    echo -e "\e[33mnpm Save-Dev Paketlerini Yüklemek İster misiniz ? e/h\e[0m"
    read -p "" npmDevSaveResult
    if [[ $npmDevSaveResult == "e" || $npmDevSaveResult == "E" ]]; then
        echo -e "\e[32mNpm Dev-Save Yüklenmeye başlandı ...\e[0m"

        # Geriye Say
        ./bashscript_countdown.sh

        npm list  
        #npm list -g 
        npm root 
        #npm root -g

        # https://www.npmjs.com/
        npm i nodemon typescript   --save-dev
        npm install lite-server --save-dev
        npm i  @types/node dotenv concurrently --save-dev
        npm i eslint eslint-config-prettier eslint-plugin-prettier npm-run-all --save-dev
        npm i prettier ts-node --save-dev
        npm install
        npm dedupe  # Bağımlılıkların tekrarlanan kopyalarını temizler.
        npm list  

    else
        echo -e "\e[31mNpm Save-Dev Yüklenmeye Başlanmadı ....\e[0m"
    fi
}
npm_local_dev_sav

#####################################################################################################
#####################################################################################################
# Global Save (Install)
npm_global_save() {
    # Geriye Say
    ./bashscript_countdown.sh

    echo -e "\n\e[36m\n###### ${NPM_GLOBAL} ######  \e[0m"
    echo -e "\e[33mnpm Global  Paketlerini Yüklemek İster misiniz ? e/h\e[0m"
    read -p "" npmGlobalResult
    if [[ $npmGlobalResult == "e" || $npmGlobalResult == "E" ]]; then
        echo -e "\e[32mNpm Global Yüklenmeye başlandı ...\e[0m"

        # Geriye Say
        ./bashscript_countdown.sh

        #npm list  
        npm list -g 
        #npm root 
        npm root -g

        # https://www.npmjs.com/
        npm i body-parser compression cors csurf cookie-parser ejs  express express-rate-limit helmet mongodb morgan mongoose swagger-jsdoc swagger-ui-express  winston -g
        npm install lite-server 
        npm list -g 
    else
        echo -e "\e[31mNpm Global Save Yüklenmeye Başlanmadı ....\e[0m"
    fi
}
npm_global_save

#####################################################################################################
#####################################################################################################
# Typescript (Install)
typescript_install() {
    # Geriye Sayım
    ./bashscript_countdown.sh
    #if [ -f "./bashscript_countdown.sh" ]; then
        ./bashscript_countdown.sh
    #else
        echo -e "\e[31mGeriye sayım scripti (bashscript_countdown.sh) bulunamadı, devam ediliyor...\e[0m"
    #fi

    echo -e "\n\e[36m###### TypeScript Kurulumu ######\e[0m"
    echo -e "\e[33mTypeScript yüklemek ister misiniz? [e/h]\e[0m"
    read -r typescriptResult
    if [[ "$typescriptResult" == "e" || "$typescriptResult" == "E" ]]; then
        echo -e "\e[32mTypeScript yüklenmeye başlıyor...\e[0m"

        # Geriye Sayım
        ./bashscript_countdown.sh
        #if [ -f "./bashscript_countdown.sh" ]; then
        #    ./bashscript_countdown.sh
        #fi

        # TypeScript kurulumları
        echo "Global TypeScript kurulumu yapılıyor..."
        npm install typescript -g          # Global kurulum
        echo "Local TypeScript kurulumu yapılıyor..."
        npm install typescript --save-dev  # Local kurulum
        echo "TypeScript ayar dosyası oluşturuluyor..."

        #tsc --init --locale tr             # TypeScript ayar dosyası
        #tsc --init --locale             # TypeScript ayar dosyası

        ls -al
        # index.ts yoksa oluştur
        if [ ! -f "tsconfig.json" ]; then
            echo "tsconfig.json oluşturuluyor..."
            cat > tsconfig.json <<EOL
/* Bu dosya hakkında daha fazla bilgi için https://aka.ms/tsconfig sayfasını ziyaret edin */
{
  "compilerOptions": {
    "target": "ES6",
    "module": "commonjs",
    "rootDir": "./src",
    "outDir": "./dist",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}
EOL
            echo "index.ts oluşturuldu ve içerik eklendi."
            ls -al
            echo "Ana dizindeyiz"
        else
            echo "index.ts zaten mevcut."
        fi

        echo -e "\e[32mTypeScript kurulumu tamamlandı!\e[0m"


        echo "Mevcut dizindeki dosyalar:"
        ls -al                             # Dosya listesini görüntüle

        # src klasörü yoksa oluştur
        if [ ! -d "src" ]; then
            mkdir src
            echo "src klasörü oluşturuldu."
        else
            echo "src klasörü zaten mevcut."
        fi

        # src dizinine gir
        cd src || { echo "src klasörüne girilemedi. Script sonlandırılıyor."; exit 1; }
        ls -al
        # index.ts yoksa oluştur
        if [ ! -f "index.ts" ]; then
            echo "index.ts oluşturuluyor..."
            cat > index.ts <<EOL
// This is the initial content of index.ts
let exam = "Merhabalar Ts";
console.log(exam);
alert("Typescript Merhabalar")
EOL
            echo "index.ts oluşturuldu ve içerik eklendi."
            cd ..
            ls -al
            echo "Ana dizindeyiz"
        else
            echo "index.ts zaten mevcut."
        fi

        echo -e "\e[32mTypeScript kurulumu tamamlandı!\e[0m"
    else
        echo -e "\e[31mTypeScript kurulumu iptal edildi.\e[0m"
    fi
}

# Fonksiyonu çalıştır
typescript_install

#####################################################################################################
#####################################################################################################
# Nodemon (Install)
nodemon_install() {
    # Geriye Sayım
    ./bashscript_countdown.sh

    echo -e "\n\e[36m\n###### Nodemon Kurulumu ######\e[0m"
    echo -e "\e[33mNodemon yüklemek ister misiniz? [e/h]\e[0m"
    read -p "" nodemonResult

    if [[ "$nodemonResult" == "e" || "$nodemonResult" == "E" ]]; then
        echo -e "\e[32mNodemon yüklenmeye başlıyor...\e[0m"

        # Geriye Sayım
        ./bashscript_countdown.sh


        # index.js yoksa oluştur
        if [ ! -f "nodemon.json" ]; then
            echo "nodemon.json oluşturuluyor..."
            cat > nodemon.json <<EOL
{
  "watch": ["src", "dist"],
  "ext": "ts,js",
  "exec": "node ./dist/index.js"
}
EOL
            echo "nodemon.json oluşturuldu ve içerik eklendi."
        else
            echo "nodemon.json zaten mevcut."
        fi

        echo -e "\e[32mnodemon kurulumu tamamlandı!\e[0m"
    else
        echo -e "\e[31mnodemon kurulumu iptal edildi.\e[0m"
    fi
}

# Fonksiyonu çalıştır
nodemon_install

#####################################################################################################
#####################################################################################################
# Update (Install)
npm_update() {
    # Geriye Sayım
    ./bashscript_countdown.sh

    echo -e "\e[36m\n###### ${NPM_UPDATE} ######  \e[0m"
    echo -e "\e[33mnpm Update  Paketlerini Yüklemek İster misiniz ? e/h\e[0m"
    read -p "" npmUpdateResult
    if [[ $npmUpdateResult == "e" || $npmUpdateResult == "E" ]]; then
        echo -e "\e[32mNpm Global Yüklenmeye başlandı ...\e[0m"

        # Geriye Say
        ./bashscript_countdown.sh
        npm outdated
        npm install
        npm update
        npm dedupe  # Bağımlılıkların tekrarlanan kopyalarını temizler.
        npm list  
    else
        echo -e "\e[31mNpm Global Save Yüklenmeye Başlanmadı ....\e[0m"
    fi
}
npm_update

#####################################################################################################
#####################################################################################################
# Npm Compiler (Install)
npm_compiler() {
    # Geriye Say
    ./bashscript_countdown.sh

    echo -e "\e[36m\n###### ${NPM_COMPILER} ######  \e[0m"
    echo -e "\e[33mnpm Compiler Paketlerini Yüklemek İster misiniz ? e/h\e[0m"
    read -p "" npmCompilerResult
    if [[ $npmCompilerResult == "e" || $npmCompilerResult == "E" ]]; then
        echo -e "\e[32mNpm Compiler Yüklenmeye başlandı ...\e[0m"

        # Geriye Say
        ./bashscript_countdown.sh
        npm rebuild             # Tüm bağımlıkları yeniden derleme
    else
        echo -e "\e[31mNpm Global Save Yüklenmeye Başlanmadı ....\e[0m"
    fi
}
npm_compiler

#####################################################################################################
#####################################################################################################
# package.json revize script eklemek
package_json_script_added() {
    # Geriye Say
    ./bashscript_countdown.sh

    echo -e "\e[36m\n###### package.json Script ekle ######  \e[0m"
    echo -e "\e[33mpackage.json script eklemek Yüklemek İster misiniz? e/h\e[0m"
    read -p "" packageJsonScriptResult
    if [[ $packageJsonScriptResult == "e" || $packageJsonScriptResult == "E" ]]; then
        echo -e "\e[32m package.json Script Yüklenmeye başlandı...\e[0m"
        # package.json dosyasının varlığını kontrol et
        PACKAGE_JSON="package.json"
        if [ ! -f "$PACKAGE_JSON" ]; then
            echo "package.json dosyası bulunamadı. Script sonlandırılıyor."
            exit 1
        fi

        # Yeni scriptler JSON formatında tanımlanıyor
        NEW_SCRIPTS=',\"server:start\": \"lite-server\",\n      \"build_watch\": \"tsc -w --pretty\",\n  \"nodemon_app_watch\": \"nodemon --watch src --watch dist ./dist/index.js\",\n  \"dev:seri\": \"npm-run-all --serial build_watch nodemon_app_watch\",\n  \"dev:paralel\": \"concurrently -k \\\"npm run build_watch\\\" \\\"npm run nodemon_app_watch\\\" \\\"npm run server:start\\\"\"'

        # "scripts" alanını bul ve "test" scriptinden sonra yeni scriptleri ekle
        sed -i.bak "/\"test\": /a \
  $NEW_SCRIPTS" "$PACKAGE_JSON"

        # İşlem tamamlandı mesajı
        if [ $? -eq 0 ]; then
            echo "Scripts başarıyla eklendi. Güncellenmiş package.json dosyası:\n"
            cat "$PACKAGE_JSON"
        else
            echo "Scripts eklenirken bir hata oluştu."
            exit 1
        fi

    else
        echo -e "\e[31mNpm Global Save Yüklenmeye Başlanmadı....\e[0m"
    fi
}
package_json_script_added

#####################################################################################################
#####################################################################################################
# Npm Compiler (Install)
server_start() {
    # Geriye Say
    ./bashscript_countdown.sh

    echo -e "\e[36m\n###### ${SERVER_START} ######  \e[0m"
    echo -e "\e[33mLite-Server başlatmak ister misiniz ? e/h\e[0m"
    read -p "" liteServerResult
    if [[ $liteServerResult == "e" || $liteServerResult == "E" ]]; then
        echo -e "\e[32mLite-Server ...\e[0m"

        # Geriye Sayım
        ./bashscript_countdown.sh

        npm install lite-server --save-dev

        # index.js yoksa oluştur
        if [ ! -f "bs-config.json" ]; then
            echo "bs-config.json oluşturuluyor..."
            cat > bs-config.json <<EOL
{
  "port": 3000,
  "files": ["./*.html", "./*.css", "./*.js"],
  "server": {
    "baseDir": "./",
    "index": "index.html"
  }
}

EOL
            echo "bs-config.jsonoluşturuldu ve içerik eklendi."
        else
            echo "bs-config.json zaten mevcut."
        fi

        echo -e "\e[32mbs-config.json kurulumu tamamlandı!\e[0m"
    else
        echo -e "\e[31mbs-config.json kurulumu iptal edildi.\e[0m"
    fi

    # Server Başlatma
    #npm run server:start
}

# Fonksiyonu çalıştır
server_start

#####################################################################################################
#####################################################################################################
# Git (Install)
git_push() {
    # Geriye Say
    ./bashscript_countdown.sh

    echo -e "\e[36m\n###### ${GIT} ######  \e[0m"
    echo -e "\e[33mGit Yüklemek İster misiniz ? e/h\e[0m"
    read -p "" gitResult
    if [[ $gitResult == "e" || $gitResult == "E" ]]; then
        echo -e "\e[32mGit Yüklenmeye başlandı ...\e[0m"

        # Geriye Say
        ./bashscript_countdown.sh
        git add .
        git commit -m "commit mesajı"
        git push
    else
        echo -e "\e[31mGit Push Yüklenmeye Başlanmadı ....\e[0m"
    fi
}
git_push

#####################################################################################################
#####################################################################################################
# Typescript başlat
npm run dev:paralel