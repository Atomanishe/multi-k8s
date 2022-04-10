docker build -t atomanishe/multi-client:latest -t atomanishe/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t atomanishe/multi-server:latest -t atomanishe/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t atomansihe/multi-worker:latest -t atomanishe/multi-worker:$SHA-f ./worker/Dockerfile ./worker

docker push atomansihe/multi-client:latest
docker push atomansihe/multi-server:latest
docker push atomanishe/multi-worker:latest

docker push atomansihe/multi-client:$SHA
docker push atomansihe/multi-server:$SHA
docker push atomanishe/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployments server=atomanishe/multi-server:$SHA
kubectl set image deployments/client-deployments client=atomanishe/multi-client:$SHA
kubectl set image deployments/worker-deployments worker=atomanishe/multi-worker:$SHA