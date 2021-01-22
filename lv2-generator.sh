
# u uri
# n name
# c number of channels
# p control ports arguments get passed to lv2-port-generator.sh

echo '@prefix lv2:  <http://lv2plug.in/ns/lv2core#> .'
echo '@prefix foaf: <http://xmlns.com/foaf/0.1/> .'
echo '@prefix doap: <http://usefulinc.com/ns/doap#> .'


while getopts "u:n:c:p:b:" options; do 
  case "${options}" in
    u)
      echo "<${OPTARG}> a lv2:plugin ;"
      ;;
    n)
      echo '  doap:name "'${OPTARG}'" ;'
      ;;
    b)
      echo "  lv2:binary <${OPTARG}> ;"
      ;;
    p)
      echo ${OPTARG}
      ;;
    *)
      exit 1
  esac
done
  
