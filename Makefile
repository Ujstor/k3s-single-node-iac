all: package_system package_apps

CHART_DIR_SYSTEM := helm/system
CHARTS_SYSTEM := cert-manager cilium ingress-nginx argocd cluster-issuer external-secrets postgres-operator minio-operator gitlab-operator

CHART_DIR_APPS := helm/apps
CHARTS_APPS := gitea portfolio streamlit-wh todo-go-htmx notes-flask wordpress-ds plausible-analytics uptime-kuma

package_system: $(CHARTS_SYSTEM)

$(CHARTS_SYSTEM):
	@echo "Packaging $@ chart..."
	@helm dependency build $(CHART_DIR_SYSTEM)/$@ || helm dependency update $(CHART_DIR_SYSTEM)/$@

package_apps: $(CHARTS_APPS)

$(CHARTS_APPS):
	@echo "Packaging $@ chart..."
	@helm dependency build $(CHART_DIR_APPS)/$@ || helm dependency update $(CHART_DIR_APPS)/$@

.PHONY: all package_system $(CHARTS_SYSTEM) package_apps $(CHARTS_APPS)
