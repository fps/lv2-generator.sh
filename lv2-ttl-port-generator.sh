echo "  ["
echo "  a lv2:ControlPort ;"

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
    n)
      echo '    lv2:name "'${OPTARG}'" ;'
      ;;
    *)
      exit 1
  esac
done
