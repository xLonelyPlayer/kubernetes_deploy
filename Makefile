
# Pods
database:
	kubectl apply -f news-database.yaml

portal:
	kubectl apply -f news-portal.yaml

system:
	kubectl apply -f news-system.yaml

pods: database portal system

# Configmaps
database_configmap:
	kubectl apply -f news-database-configmap.yaml

portal_configmap:
	kubectl apply -f news-portal-configmap.yaml

system_configmap:
	kubectl apply -f news-system-configmap.yaml

configmap: database_configmap portal_configmap system_configmap

# Services
database_svc:
	kubectl apply -f svc-news-database.yaml

portal_svc:
	kubectl apply -f svc-news-portal.yaml

system_svc:
	kubectl apply -f svc-news-system.yaml

svc: database_svc portal_svc system_svc

# Deployment
nginx_deployment:
	kubectl apply -f nginx-deployment.yaml

portal_deployment:
	kubectl apply -f news-portal-deployment.yaml

system_deployment:
	kubectl apply -f news-system-deployment.yaml

database_deployment:
	kubectl apply -f news-database-deployment.yaml

deployment: portal_deployment system_deployment database_deployment

# Cleaning stuff
clean_pods:
	kubectl delete pods --all

clean_svc:
	kubectl delete svc --all

clean_configmap:
	kubectl delete configmap --all

clean_replicaset:
	kubectl delete replicaset --all

clean_deployment:
	kubectl delete deployment --all

clean: clean_deployment \
	clean_replicaset \
	clean_configmap \
	clean_svc \
	clean_pods \

# Starts everything
all: configmap \
	pods \
	svc \
	deployment