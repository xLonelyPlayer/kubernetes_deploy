
database:
	kubectl apply -f news-database.yaml

portal:
	kubectl apply -f news-portal.yaml

system:
	kubectl apply -f news-system.yaml

pods: database portal system

database_configmap:
	kubectl apply -f news-database-configmap.yaml

portal_configmap:
	kubectl apply -f news-portal-configmap.yaml

system_configmap:
	kubectl apply -f news-system-configmap.yaml

configmap: database_configmap portal_configmap system_configmap

database_svc:
	kubectl apply -f svc-news-database.yaml

portal_svc:
	kubectl apply -f svc-news-portal.yaml

system_svc:
	kubectl apply -f svc-news-system.yaml

svc: database_svc portal_svc system_svc

clean_pods:
	kubectl delete pods --all

clean_svc:
	kubectl delete svc --all

clean_configmap:
	kubectl delete configmap --all

clean: clean_pods clean_svc clean_configmap

all: pods svc configmap
