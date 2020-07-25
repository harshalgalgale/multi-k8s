 docker build -t harshalgalgale/multi-client:latest -t harshalgalgale/multi-client:$SHA -f ./client/Dockerfile ./client
 docker build -t harshalgalgale/multi-server:latest -t harshalgalgale/multi-server:$SHA -f ./server/Dockerfile ./server
 docker build -t harshalgalgale/multi-worker:latest -t harshalgalgale/multi-worker:$SHA -f ./worker/Dockerfile ./worker

 docker push harshalgalgale/multi-client:latest
 docker push harshalgalgale/multi-server:latest
 docker push harshalgalgale/multi-worker:latest

 docker push harshalgalgale/multi-client:$SHA
 docker push harshalgalgale/multi-server:$SHA
 docker push harshalgalgale/multi-worker:$SHA

 kubectl apply -f k8s
 kubectl set deployments/server-deployment server=harshalgalgale/multi-server:$SHA
 kubectl set deployments/client-deployment client=harshalgalgale/multi-client:$SHA
 kubectl set deployments/worker-deployment worker=harshalgalgale/multi-worker:$SHA

