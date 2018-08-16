
# namespace

        kubectl create -f kyle.yaml
        
        // identify the secret anme
        kubectl get sa kyle-service-account -n kyle -o yaml

        // get encoded CA, -o yaml exposes the value of CA, CA and token are encoded with -o yaml
        kubectl get secret -n kyle $(kubectl get secrets -n kyle | grep ^kyle-service-account-token | cut -f1 -d ' ') -o yaml

        // get decoded token, it's decoded without -o yaml
        TOKEN=$(kubectl describe secret -n kyle $(kubectl get secrets -n kyle | grep ^kyle-service-account-token | cut -f1 -d ' ') | grep -E '^token' | cut -f2 -d':' | tr -d " ")

        // update kubeconfig directly with encoded CA and decoded token

        // (optionally) decode CA and use kubectl config to create config file
        base64 --decode -i ca.crt > kyle.crt

        // verify
        kubectl --kubeconfig kyle-config version


        // check permission
        kubectl get role -n kyle
        kubectl describe role kyle-deploy-role -n kyle

        kubectl get rolebindings -n kyle
        kubectl describe rolebindings -n kyle

        kubectl auth can-i get services -n kyle --as kyle-service-account