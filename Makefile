PLATFORMS = android-arm\
		 darwin-x64\
		 linux-x86\
		 linux-x64\
		 linux-arm\
		 linux-armv6\
		 linux-arm64\
		 windows-x64\
		 windows-x86
DOCKER    = docker
IMAGE     = dimitriss/cross-compiler

base:
	$(DOCKER) build -t $(IMAGE):base .

.PHONY: $(PLATFORMS)

$(PLATFORMS):
	$(DOCKER) build -t $(IMAGE):$@ $@;

all:
	$(MAKE) base
	for i in $(PLATFORMS); do \
		$(MAKE) $$i; \
	done