system_configmap:
	kubectl apply -f news-system-configmap.yaml

portal_configmap:
	kubectl apply -f news-portal-configmap.yaml

database_configmap:
	kubectl apply -f news-database-configmap.yaml

configmap: database_configmap portal_configmap system_configmap

system_svc:
	kubectl apply -f svc-news-system.yaml

database_svc:
	kubectl apply -f svc-news-database.yaml

portal_svc:
	kubectl apply -f svc-news-portal.yaml

svc: database_svc portal_svc system_svc

portal_deployment:
	kubectl apply -f news-portal-deployment.yaml

system_deployment:
	kubectl apply -f news-system-deployment.yaml

database_deployment:
	kubectl apply -f news-database-deployment.yaml

deployment: portal_deployment system_deployment database_deployment

system_statefulset:
	kubectl apply -f news-system-statefulset.yaml

statefulset: system_statefulset

images_pvc:
	kubectl apply -f images-pvc.yaml

session_pvc:
	kubectl apply -f session-pvc.yaml

pvc: images_pvc session_pvc

all: configmap \
	svc \
	deployment \
	statefulset \
	pvc

clean_svc:
	kubectl delete svc --all

clean_configmap:
	kubectl delete configmap --all

clean_deployment:
	kubectl delete deployment --all

clean_statefulset:
	kubectl delete statefulset --all

clean_pvc:
	kubectl delete pvc --all

clean: clean_deployment \
	clean_configmap \
	clean_svc \
	clean_statefulset \
	clean_pvc


