# for client app
docker build  -t ${CLIENT_APP} ./front

docker tag ${CLIENT_APP} asia.gcr.io/${GOOGLE_PROJECT_ID}/${CLIENT_APP}:${CIRCLE_SHA1}

docker push asia.gcr.io/${GOOGLE_PROJECT_ID}/${CLIENT_APP}:${CIRCLE_SHA1}

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=asia.gcr.io/${GOOGLE_PROJECT_ID}/${CLIENT_APP}:${CIRCLE_SHA1}


