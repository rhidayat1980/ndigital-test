# ndigital-test

this repo contain my answer to ndigital technical assesment for devops engineer.

in this repo i want to demostrate how i use terraform to install nginx with kubernetes provider (default k8s object in terraform), helm provider (to install redis with helm chart with terraform).

steps:

1. set provider : kubernetes and helm.
2. create namespace to install my apps (ndigital namespace).
3. setup nginx with default k8s object in terraform.
4. setup redis cluster with helm chart in terraform.


check the apps: 

kubectl get all -n ndigital

NAME                        READY   STATUS    RESTARTS   AGE
pod/nginx-76bb4f84d-6n59v   1/1     Running   0          155m
pod/nginx-76bb4f84d-fcn2l   1/1     Running   0          155m
pod/redis-master-0          2/2     Running   0          154m
pod/redis-slave-0           2/2     Running   0          154m
pod/redis-slave-1           2/2     Running   0          154m

NAME                     TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/nginx            NodePort    10.110.150.124   <none>        80:30201/TCP   155m
service/redis-headless   ClusterIP   None             <none>        6379/TCP       154m
service/redis-master     ClusterIP   10.110.188.28    <none>        6379/TCP       154m
service/redis-metrics    ClusterIP   10.110.233.174   <none>        9121/TCP       154m
service/redis-slave      ClusterIP   10.110.7.255     <none>        6379/TCP       154m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   2/2     2            2           155m

NAME                              DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-76bb4f84d   2         2         2       155m

NAME                            READY   AGE
statefulset.apps/redis-master   1/1     154m
statefulset.apps/redis-slave    2/2     154m

4. setup github action to run tfsec on this repo, tfsec is security checking for infra as code, for example in this repo https://github.com/rhidayat1980/ndigital-test/blob/main/.github/workflows/tfsec.yml

another good example is https://github.com/marketplace/bridgecrew. but its a paid version so i cannot demonstrate on this repo.

5. I solve this task 5 hours, normaly 1 or 2 hours. i have another task from traveloka.

6. for provisioning infra, normally i use terraform, but its also depends on the eixsting team and solution, i dont have any problem to follow to use existing tools, puppet, chef, ansible, saltstack its ok for me.

7. i hate cloudformation hehehe.

8. to secure my application? its a long answer actually, because security follow the layer, from infra layer to application layer. to secure our product we have to secure all layer by the way!

9. i have a rule, monitoring is important, dont deploy any service if they dont have monitoring system. for metric i follow 4 golden rule from the SRE book created by google employee, traffict, error, latency and saturation.

10. Could you extend your solution to launch multiple instances of your app/tools? What
would need to change to support this use case?
Could you extend your solution to replace a running instance with little or no downtime?
How?
with kubernetes (k8s) scalling is not a problem anymore, just increase the replicaset number or use HPA (horizontal pod autoiscale) and the problem is gone.

to reduce downtime, we can use deployment strategy inside k8s deployment object or by using blue green, but for the last one need a lot of additional task.

11. Was it a priority to make your code well structured, extensible, and reusable?
    yes, this is the first step before moving. the intention are to segregate, group or categorize everything by environment for example dev, staging and production for security and critical level, also to make our live easy as engineer. the next reason for me is to give engineer a confident by provide them a playground to test new thing.

12. What sacrifices did you make due to time? Any improvement that you would add to make the system production ready?

