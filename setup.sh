QMAIL_PREFIX="lists"
dir=`pwd`

# -a – archive (default)
# -d – Digest
# -i – Web-indexed
# -m – Moderated
ezmlm-make -adi ${dir}/discuss ~/.qmail-${QMAIL_PREFIX}-discuss discuss lists.model-ling.eu

ezmlm-make -adim ${dir}/info ~/.qmail-${QMAIL_PREFIX}-info info lists.model-ling.eu
ezmlm-sub ${dir}/info mod ${OWNER}

