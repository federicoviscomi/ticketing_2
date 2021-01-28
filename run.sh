cd auth
npm install
cd ../
docker-compose build
docker-compose push
skaffold dev
