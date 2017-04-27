QMAIL_PREFIX?=lists
EZMLM_ROOT?=~/ezmlm

# -a – archive (default)
# -d – Digest
# -m – Moderated
# -i – Web-indexed
# -n – permit remote new text files editing

clean:
	rm -f ~/.qmail-${QMAIL_PREFIX}-*
	rm -rf ${EZMLM_ROOT}

${EZMLM_ROOT} :
	mkdir ${EZMLM_ROOT}

${EZMLM_ROOT}/discuss : ${EZMLM_ROOT}
	ezmlm-make -adi ${EZMLM_ROOT}/discuss \
		~/.qmail-${QMAIL_PREFIX}-discuss \
		discuss lists.model-ling.eu
	cp -R discuss/* ${EZMLM_ROOT}/discuss/

${EZMLM_ROOT}/info : ${EZMLM_ROOT}
	ezmlm-make -admi ${EZMLM_ROOT}/info \
		~/.qmail-${QMAIL_PREFIX}-info \
		info lists.model-ling.eu
	cp -R info/* ${EZMLM_ROOT}/info/
	ezmlm-sub ${EZMLM_ROOT}/info mod ${OWNER}

lists : ${EZMLM_ROOT}/info ${EZMLM_ROOT}/discuss

