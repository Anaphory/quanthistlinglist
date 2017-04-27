QMAIL_PREFIX?="lists"
EZMLM_ROOT?=~/ezmlm

# -a – archive (default)
# -d – Digest
# -i – Web-indexed
# -m – Moderated

clean:
	rm -f ~/.qmail-${QMAIL_PREFIX}-*
	rm -rf ${EZMLM_ROOT}

${EZMLM_ROOT} :
	mkdir ${EZMLM_ROOT}

${EZMLM_ROOT}/discuss : ${EZMLM_ROOT}
	ezmlm-make -adi ${EZMLM_ROOT}/discuss \
		~/.qmail-${QMAIL_PREFIX}-discuss \
		discuss lists.model-ling.eu

${EZMLM_ROOT}/info : ${EZMLM_ROOT}
	ezmlm-make -adim ${EZMLM_ROOT}/info \
		~/.qmail-${QMAIL_PREFIX}-info \
		info lists.model-ling.eu
	if [ -n ${OWNER} ] ; \
		then ezmlm-sub ${EZMLM_ROOT}/info mod ${OWNER} ; \
	fi

update:
	cp -R discuss/* ${EZMLM_ROOT}/discuss/
	cp -R info/* ${EZMLM_ROOT}/info/

lists: ${EZMLM_ROOT}/info ${EZMLM_ROOT}/discuss update

