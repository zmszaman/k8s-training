helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm upgrade --install nginx-ingress --namespace nginx-ingress --create-namespace ingress-nginx/ingress-nginx \
    --set controller.ingressClassResource.name=nginx \
    --set controller.ingressClassResource.enabled=true \
    --set controller.ingressClassResource.default=true \
    --set=controller.service.type=NodePort \
    --set-string=controller.nodeSelector.ingress-ready=true \
    --set=controller.hostPort.enabled=true \
    --set=controller.admissionWebhooks.enabled=false \
    --set=controller.tolerations[0].key=node-role.kubernetes.io/master \
    --set=controller.tolerations[0].operator=Exists \
    --set=controller.tolerations[0].effect=NoSchedule