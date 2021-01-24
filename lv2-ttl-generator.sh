# m mode (cpp, ttl, manifest, manifest-prefix)
# u uri
# n name
# b name of plugin binary
# c number of audio channels
# t name of seeAlso ttl
# p control ports arguments get passed to lv2-port-generator.sh
# s name of cpp struct
# o project uri


let control_port_index=0
channels=0

while getopts "m:r:s:t:u:n:c:p:b:o:" options; do 
  case "${options}" in
    m)
      mode="${OPTARG}"
      ;;
    u)
      uri="${OPTARG}"
      ;;
    n)
      pname="${OPTARG}"
      ;;
    t)
      seealso="${OPTARG}"
      ;;
    b)
      binary="${OPTARG}"
      ;;
    c)
      channels="${OPTARG}"
      ;;
    p) 
      control_ports[$control_port_index]=${OPTARG}
      # echo ${OPTARG}
      # bash ./lv2-ttl-port-generator.sh -m ${port_index} ${OPTARG}
      let control_port_index+=1
      ;;
    s)
      struct="${OPTARG}"
      ;;
    o)
      project_uri="${OPTARG}"
      ;;
    *)
      exit 1
  esac
done

if [ "$mode" = "cpp" ]; then
  echo '#define PLUGIN_URI "'${uri}'"'
fi

if [ "$mode" = "manifest" ]; then
  echo "<${uri}> a lv2:Plugin ;"
  echo "  rdfs:seeAlso <${seealso}> ."
fi

if [ "$mode" = "manifest-prefix" ]; then
  echo '@prefix lv2:  <http://lv2plug.in/ns/lv2core#> .'
  echo '@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .'
  echo
fi

if [ "$mode" = "ttl" ]; then
  let port_index=0
  echo '@prefix lv2:  <http://lv2plug.in/ns/lv2core#> .'
  echo '@prefix foaf: <http://xmlns.com/foaf/0.1/> .'
  echo '@prefix doap: <http://usefulinc.com/ns/doap#> .'
  echo '@prefix units: <http://lv2plug.in/ns/extensions/units#> .'
  echo '@prefix pprops: <http://lv2plug.in/ns/ext/port-props#> .'
  echo '@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .'
  echo
  echo "<${uri}> a lv2:Plugin ;"
  echo '  doap:name "'${pname}'" ;'
#  echo "  lv2:project <${project_uri}> ;"
  echo "  lv2:binary <${binary}> ;"
  echo "  lv2:port"
  for n in `seq 1 ${channels}`; do
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
  num_cp=${#control_ports[@]}
  for n in `seq 0 $((num_cp-1))`; do
    if ((port_index>0)); then
      echo "  ,"
    fi
    bash -c "bash ./lv2-ttl-port-generator.sh -m ${port_index} ${control_ports[$n]}"
    let port_index+=1
  done 
  echo "  ."
fi
