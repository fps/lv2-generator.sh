# Arguments should be passed in this order

# u uri
# n name
# b name of plugin binary
# c number of audio channels
# p control ports arguments get passed to lv2-port-generator.sh



echo '@prefix lv2:  <http://lv2plug.in/ns/lv2core#> .'
echo '@prefix foaf: <http://xmlns.com/foaf/0.1/> .'
echo '@prefix doap: <http://usefulinc.com/ns/doap#> .'
echo '@prefix units: <http://lv2plug.in/ns/extensions/units#> .'
echo '@prefix foaf: <http://xmlns.com/foaf/0.1/> .'
echo '@prefix pprops: <http://lv2plug.in/ns/ext/port-props> .'
echo


let port_index=0

while getopts "u:n:c:p:b:" options; do 
  case "${options}" in
    u)
      echo "<${OPTARG}> a lv2:Plugin ;"
      ;;
    n)
      echo '  doap:name "'${OPTARG}'" ;'
      ;;
    b)
      echo "  lv2:binary <${OPTARG}> ;"
      ;;
    c)
      echo "  lv2:port"
      for n in `seq 1 ${OPTARG}`; do
        if ((port_index>0)); then
          echo "  ,"
        fi
        echo "  ["
        echo "    a lv2:AudioPort ;"
        echo "    a lv2:InputPort ;"
        echo "    lv2:index ${port_index} ;"
        echo '    lv2:name "in'${n}'" ;'
        echo '    lv2:symbol "in'${n}'" ;'
        echo "  ]"
        echo "  ,"
        let port_index+=1
        echo "  ["
        echo "    a lv2:AudioPort ;"
        echo "    a lv2:OutputPort ;"
        echo "    lv2:index ${port_index} ;"
        echo '    lv2:name "out'${n}'" ;'
        echo '    lv2:symbol "out'${n}'" ;'
        echo "  ]"
        let port_index+=1
       done
      ;;
    p) 
      if ((port_index>0)); then
        echo "  ,"
      fi
      # echo ${OPTARG}
      bash ./lv2-ttl-port-generator.sh -m ${port_index} ${OPTARG}
      let port_index+=1
      ;;
    *)
      exit 1
  esac
done

echo .  
