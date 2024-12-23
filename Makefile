all: update-repos package_system package_apps

update-repos:
	@echo "Updating Helm repositories..."
	@helm repo update

CHART_DIR_SYSTEM := helm/system
CHARTS_SYSTEM := cert-manager cilium ingress-nginx argocd cluster-issuer external-secrets postgres-operator minio-operator gitlab-operator metallb-operator metallb-config prometheus-grafana

CHART_DIR_APPS := helm/apps
CHARTS_APPS := gitea portfolio streamlit-wh todo-go-htmx notes-flask wordpress-ds plausible-analytics uptime-kuma harbor gitlab s3-storage fastapi github-readme-stats mailserver todo-django

package_system: $(CHARTS_SYSTEM)

$(CHARTS_SYSTEM):
	@echo "Packaging $@ chart..."
	@helm dependency build --skip-refresh $(CHART_DIR_SYSTEM)/$@ || helm dependency update --skip-refresh $(CHART_DIR_SYSTEM)/$@

package_apps: $(CHARTS_APPS)

$(CHARTS_APPS):
	@echo "Packaging $@ chart..."
	@helm dependency build --skip-refresh $(CHART_DIR_APPS)/$@ || helm dependency update --skip-refresh $(CHART_DIR_APPS)/$@

.PHONY: all package_system $(CHARTS_SYSTEM) package_apps $(CHARTS_APPS) update-repos
