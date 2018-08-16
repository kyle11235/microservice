# helloworld

        kubectl run hello-world --replicas=1 --labels="app=hello-world" --image=gcr.io/google-samples/node-hello:1.0  --port=8080

        kubectl expose deployment hello-world --type=NodePort --name=hello-world
        kubectl expose deployment hello-world --type=LoadBalancer --name=hello-world

        kubectl get pods --selector="app=hello-world" --output=wide

        kubectl describe services hello-world

        kubectl delete services hello-world

        kubectl delete deployments hello-world
