drafter: ext/drafter/bin/drafter

DRAFTER_VERSION = v3.2.7

clean:
	rm -f drafter
	rm -rf ext

drafter.go: ext/drafter/bin/drafter
	@go get github.com/mjibson/esc
	go generate parser.go

ext/drafter/bin/drafter:
	mkdir -p ext
	wget https://github.com/apiaryio/drafter/releases/download/$(DRAFTER_VERSION)/drafter-$(DRAFTER_VERSION).tar.gz
	tar -xzf drafter-$(DRAFTER_VERSION).tar.gz -C ext
	rm drafter-$(DRAFTER_VERSION).tar.gz
	mv ext/drafter-$(DRAFTER_VERSION) ext/drafter
	$(MAKE) -C ext/drafter drafter
	cp ext/drafter/bin/drafter drafter

.PHONY: clean
