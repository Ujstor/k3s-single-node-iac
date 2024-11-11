all: package

CHART_DIR := helm/system
CHARTS := cert-manager cilium ingress-nginx argo-cd

package: $(CHARTS)

$(CHARTS):
	@echo "Packaging $@ chart..."
	@helm dependency build $(CHART_DIR)/$@ 

.PHONY: all package $(CHARTS)
