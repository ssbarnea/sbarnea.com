all: test

prepare:
	echo

build:
	hugo --cleanDestinationDir --i18n-warnings --ignoreCache

clean:
	rm -rf public/

bin/htmltest:
	curl https://htmltest.wjdp.uk | bash

test: build bin/htmltest
	hugo check ulimit
	ulimit -n 2048
	@echo "INFO: Validating output using https://github.com/wjdp/htmltest"
	./bin/htmltest

deploy: test
	hugo deploy -v --maxDeletes 0
	# --dryRun

serve: build
	# --enableGitInfo
	bash -c "killall hugo; hugo server -p 1313 -D --noHTTPCache &"

stop:
	killall hugo
