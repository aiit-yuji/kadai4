#!/bin/bash
############################################################
# NAME:tesT_getgcf.sh 
#
# DESCRIPTION:
#  test code for getgcf.sh
#
# 
#############################################################

T_1=("16 24" "引数が2つのケース(第一引数>第二引数)" "TRUE" "8")
T_2=("24 16" "引数が2つのケース(第一引数<第二引数)" "TRUE" "8")
T_3=("16 24 8" "引数が3つのケース" "FALSE" "ERROR")
T_4=("16" "引数が1つのケース" "FALSE" "ERROR")
T_5=("" "引数がないケース" "FALSE" "ERROR")
T_6=("0 16" "引数に0があるケース" "FALSE" "ERROR")
T_7=("Hello 16" "引数に文字列があるケース" "FALSE" "ERROR")
T_8=("8.0 16" "引数に小数があるケース" "FALSE" "ERROR")
T_9=("-8 16" "引数に負の数があるケース" "FALSE" "ERROR")
T_SUM=`grep '^T_[1-9]*=' ${0} | wc -l`

for NUM in `seq 1 ${T_SUM}`
do
VAR1="\${T_${NUM}[0]}"
VAR2="\${T_${NUM}[1]}"
VAR3="\${T_${NUM}[2]}"
VAR4="\${T_${NUM}[3]}"
RESULT=`./getgcf.sh $(eval echo ${VAR1})`
DESCRIPTION=$(eval echo ${VAR2})
if [ `eval echo ${VAR3}` == TRUE ] ; then
  EXPECT=`eval echo ${VAR4}`
  [[ ${RESULT} -eq ${EXPECT} ]] && echo -n "T_${NUM} OK" || echo -n "T_${NUM} NG"
else
  EXPECT=`eval echo ${VAR4}`
  [[ ${RESULT} =~ ${EXPECT} ]] && echo -n "T_${NUM} OK" || echo -n "T_${NUM} NG"
fi
echo " ${DESCRIPTION}"
done
