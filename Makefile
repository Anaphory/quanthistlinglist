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
	rm ~/cgi-bin/ezmlmbrowse.ini
	rm ~/cgi-bin/lists

${EZMLM_ROOT} :
	mkdir ${EZMLM_ROOT}

${EZMLM_ROOT}/discuss : ${EZMLM_ROOT}
	ezmlm-make -adi ${EZMLM_ROOT}/discuss \
		~/.qmail-${QMAIL_PREFIX}-discuss \
		discuss lists.model-ling.eu

${EZMLM_ROOT}/info : ${EZMLM_ROOT}
	ezmlm-make -admi ${EZMLM_ROOT}/info \
		~/.qmail-${QMAIL_PREFIX}-info \
		info lists.model-ling.eu
	if [ -n ${OWNER} ] ; \
		then ezmlm-sub ${EZMLM_ROOT}/info mod ${OWNER} ; \
	fi

update:
	cp -R discuss/* ${EZMLM_ROOT}/discuss/
	cp -R info/* ${EZMLM_ROOT}/info/

lists: ${EZMLM_ROOT}/info ${EZMLM_ROOT}/discuss update

~/cgi-bin/ezmlmbrowse.ini:
	cp ezmlmbrowse.ini ~/cgi-bin/

~/cgi-bin/lists:
	cp lists ~/cgi-bin/
	chmod u+x ~/cgi-bin/lists

archive: ~/cgi-bin/lists ~/cgi-bin/ezmlmbrowse.ini


