# for client app
docker build  -t asia.gcr.io/${GOOGLE_PROJECT_ID}/${CLIENT_APP}:${CIRCLE_SHA1} -t asia.gcr.io/${GOOGLE_PROJECT_ID}/${SERVER_APP}:latest ./front
docker build  -t asia.gcr.io/${GOOGLE_PROJECT_ID}/${SERVER_APP}:${CIRCLE_SHA1} -t asia.gcr.io/${GOOGLE_PROJECT_ID}/${SERVER_APP}:latest ./back

docker push asia.gcr.io/${GOOGLE_PROJECT_ID}/${CLIENT_APP}:${CIRCLE_SHA1}
docker push asia.gcr.io/${GOOGLE_PROJECT_ID}/${SERVER_APP}:${CIRCLE_SHA1}

docker push asia.gcr.io/${GOOGLE_PROJECT_ID}/${CLIENT_APP}:latest
docker push asia.gcr.io/${GOOGLE_PROJECT_ID}/${SERVER_APP}:latest


kubectl apply -f k8s

kubectl set image deployments/client-deployment client=asia.gcr.io/${GOOGLE_PROJECT_ID}/${CLIENT_APP}:${CIRCLE_SHA1}
kubectl set image deployments/server-deployment server=asia.gcr.io/${GOOGLE_PROJECT_ID}/${SERVER_APP}:${CIRCLE_SHA1}


