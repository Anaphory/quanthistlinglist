QMAIL_PREFIX?="lists"
dir=`pwd`

# -a – archive (default)
# -d – Digest
# -i – Web-indexed
# -m – Moderated
clean:
	rm ~/.qmail-${QMAIL_PREFIX}-*
	git clean -dfx

discuss:
	mkdir -p ${dir}/discuss
	ezmlm-make -eadi ${dir}/discuss \
		~/.qmail-${QMAIL_PREFIX}-discuss \
		discuss lists.model-ling.eu

discuss:
	mkdir -p ${dir}/info
	ezmlm-make -eadim ${dir}/info \
		~/.qmail-${QMAIL_PREFIX}-info \
		info lists.model-ling.eu
	ezmlm-sub ${dir}/info mod ${OWNER}


