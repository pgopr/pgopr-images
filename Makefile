#
# Eclipse Public License - v 2.0
#
# THE ACCOMPANYING PROGRAM IS PROVIDED UNDER THE TERMS OF THIS ECLIPSE
# PUBLIC LICENSE ("AGREEMENT"). ANY USE, REPRODUCTION OR DISTRIBUTION
# OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.
#
IMAGES = \
	pgexporter-rocky10 \
	pgmoneta-rocky10 \
	pgsql18-primary-rocky10 \
	pgsql18-replica-rocky10

.PHONY: build clean $(IMAGES)

build: $(IMAGES)

$(IMAGES):
	$(MAKE) -C $@ build

clean:
	@for img in $(IMAGES); do \
		$(MAKE) -C $$img clean; \
	done
