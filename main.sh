# See http://www.bnikolic.co.uk/blog/bash-unbound-variable.html for
# discussion

# Shell options
set -u
shopt -s nullglob

# This should given an unbound variable error 
echo $nosuchvar

# This will also give an unbound variable error!
vv=/tmp/nosuchfile*
vv=($vv)
echo $vv

# This correctly deals with no such files condidtion
vv=/tmp/nosuchfile*
vv=($vv)
if [ -n "${vv:-}" ]; then
    echo $vv
fi

