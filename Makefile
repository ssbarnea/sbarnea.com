PYTHON ?= $(shell command -v python3 python|head -n1)
.EXPORT_ALL_VARIABLES:

default: help

define PRINT_HELP_PYSCRIPT
import re, sys

print("Usage: make <target>")
cmds = {}
for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
	  target, help = match.groups()
	  cmds.update({target: help})
for cmd in sorted(cmds):
		print(" * '%s' - %s" % (cmd, cmds[cmd]))
endef
export PRINT_HELP_PYSCRIPT

help:
	@$(PYTHON) -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

prepare:
	echo

build:  ## build
	hugo --cleanDestinationDir --i18n-warnings --ignoreCache

clean:  ## clean
	rm -rf public/

bin/htmltest:
	curl https://htmltest.wjdp.uk | bash

test: build bin/htmltest  # test
	hugo check ulimit
	ulimit -n 2048
	@echo "INFO: Validating output using https://github.com/wjdp/htmltest"
	# ./bin/htmltest

deploy: test  ## publish to S3
	hugo deploy -v --maxDeletes 0 --invalidateCDN
	# --dryRun

serve: build  ## serve locally
	# --enableGitInfo
	bash -c "killall hugo; hugo server -p 1313 -D --noHTTPCache &"

stop:
	killall hugo
