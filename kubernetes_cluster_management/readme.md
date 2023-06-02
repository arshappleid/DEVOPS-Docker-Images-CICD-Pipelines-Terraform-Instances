## Steps to send the pods to cluster (deployment) or create a cluster-deployment
1.  ``` kubectl create deployment deployment-name --image=image-id-dockerhub  ``` this will create the cluster.
2.  ``` kubectl get deployments ``` will give the status of the deployment.
3.  ``` kubectl get pods ```
4.  ``` kubectl delete deployment deployment-name ```


The above pods will be running in the Worker node server . And Since we are running kubectl locally our local host will be the master server.


## Creating a service to expose the pods to local and to internet.
1. ``` kubectl expose deployment deployment-name --type=NodePort --port=8080```
    - ```--type=NodePort``` : exposes using worker node IP adddress.
    - ```--type=LoadBalancer``` : exposes using Load LoadBalancer , prefferred way . Since LoadBalancer , will redirect traffic to rest of the pods.
2. ``` kubectl get services ``` :  will give you the status of the service.
    - Cluster IP - is useless since clusters can go up and down.
    - External IP - IP address of the worker node.

## Updating the deployment , using a new Image or updated docker image.
1. Update the docker image , by building it again and pushing to docker hub. Do this through CI/CD.
2. ``` kubectl set image deployment/deployment-name dockerhub_image=dockerhub_image:v2 ``` Will pull the latest image from docker hub.
    - In the above command, we updated our deployment with the same image , so we used the same image name.

## Rolling back to previous version / deleting deployment
```kubectl rollout undo deployment/deployment-name``` : Will undo the deployment.
```kubectl rollout history deployment/deployment-name``` : Will give deployment history of the deployment
```kubectl rollout history deployment/deployment-name --to-revision=1``` : Will revert to the first deployment.
```kubectl deleted deployment/deployment-name``` : Will give deployment history of the deployment


## Using AWS Load Balancer to configure the IP address and DNS Settings.


## Deleting kubernetes pods :
- ``` kubectl delete -f=deployment.yaml``` will delete the kubernetes cluster.
  
## Grouping deployment and services.
- Assign the labels : then group subtage , and map all the deployment and services related to one product ,






















