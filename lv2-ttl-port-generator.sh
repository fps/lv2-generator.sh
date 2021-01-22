echo "  ["
echo "    a lv2:ControlPort ;"

# n name
# s symbol
# l logarithmic
# i minimum
# x maximum
# d default
# h units: Hz
# m index
while getopts "n:s:i:d:x:m:lh" options; do
  case "${options}" in
    m)
      echo "    lv2:index ${OPTARG} ;"
      ;;
    n)
      echo '    lv2:name "'${OPTARG}'" ;'
      ;;
    s)
      echo '    lv2:symbol "'${OPTARG}'" ;'
      ;;
    d)
      echo "    lv2:default ${OPTARG} ;"
      ;;
    i)
      echo "    lv2:minimum ${OPTARG} ;"
      ;;
    x)
      echo "    lv2:maximum ${OPTARG} ;"
      ;;
    l)
      echo "    lv2:PortProperty pprops:logarithmic ;"
      ;;
    h)
      echo "    units:unit units:hz ;"
      ;;
    *)
      exit 1
  esac
done

echo "  ]"
