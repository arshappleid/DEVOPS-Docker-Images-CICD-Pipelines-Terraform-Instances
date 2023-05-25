## Steps to send the pods to cluster (deployment) or create a cluster-deployment
1.  ``` kubectl create deployment deployment-name --image=image-id-dockerhub  ``` this will create the cluster.
2.  ``` kubectl get deployments ``` will give the status of the deployment.
3.  ``` kubectl get pods ```
4.  ``` kubectl delete deployment deployment-name ```


## Creating a service to expose the pods to local and to internet.
1. 