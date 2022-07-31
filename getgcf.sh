#!/bin/bash
############################################################
# NAME:getgcf.sh 
#
# DESCRIPTION:
#  Find the greatest common Factror(gcf) from tow natural number.
#
# Usage: getgcf.sh NUM1 NUM2
# 
############################################################

# 引数の数をチェック
if [ ${#} -ne 2 ];then
  echo "[ERROR] Usage:  getgcf.sh NUM1 NUM2"
  exit 1
fi

MAXNUM=""
MINNUM=""

for NUM in ${@}
do
  # 与えられた引数が自然数であるかチェック
  if [ ! $(expr "${NUM}" : "[1-9][0-9]*$" 1>&/dev/null;echo $?) -eq 0 ] ; then
    echo "[ERROR] arguments must be natural number"
    exit 1 
  fi

  # 与えられた引数の数字の大小比較
  if [ -z ${MAXNUM} ] ; then
    MAXNUM=${NUM}
  elif [ ${MAXNUM} -gt ${NUM} ] ; then
    MINNUM=${NUM}
  else
    MINNUM=${MAXNUM}
    MAXNUM=${NUM}
  fi
done

QUOTIENT=""
REMAINDER=""
DIVIDIEND=${MAXNUM}
DIVISOR=${MINNUM}

# ユークリッドの互助法で最大公約数を求める
while : 
do
  #QUOTIENT=$(( ${DIVIDIEND} / ${DIVISOR} ))
  REMAINDER=$(( ${DIVIDIEND} % ${DIVISOR} ))

  if [ ${REMAINDER} -eq 0 ] ; then
    break
  fi

  DIVIDIEND=${DIVISOR}
  DIVISOR=${REMAINDER}
done

echo ${DIVISOR}
exit 0
