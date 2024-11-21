all: package_system package_apps

CHART_DIR_SYSTEM := helm/system
CHARTS_SYSTEM := cert-manager cilium ingress-nginx argocd vault cluster-issuer external-secrets postgres-operator

CHART_DIR_APPS := helm/apps
CHARTS_APPS := gitea postgres-cluster portfolio streamlit-wh

package_system: $(CHARTS_SYSTEM)

$(CHARTS_SYSTEM):
	@echo "Packaging $@ chart..."
	@helm dependency build $(CHART_DIR_SYSTEM)/$@ || helm dependency update $(CHART_DIR_SYSTEM)/$@

package_apps: $(CHARTS_APPS)

$(CHARTS_APPS):
	@echo "Packaging $@ chart..."
	@helm dependency build $(CHART_DIR_APPS)/$@ || helm dependency update $(CHART_DIR_APPS)/$@

.PHONY: all package_system $(CHARTS_SYSTEM) package_apps $(CHARTS_APPS)
