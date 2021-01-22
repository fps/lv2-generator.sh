./lv2-ttl-generator.sh -m ttl -u http://fps.io/plugin -n "Simple Filter" -t simple-filter.ttl -b simple-filter.so -c 2 -p "-n foo -s foo" -p "-n bar -s bar" > test.ttl

lv2_validate test.ttl

./lv2-ttl-generator.sh -m manifest-prefix -u http://fps.io/plugin -n "Simple Filter" -t test.ttl -b simple-filter.so -c 2 -p "-n foo -s foo" -p "-n bar -s bar" > test_manifest.ttl
./lv2-ttl-generator.sh -m manifest -u http://fps.io/plugin -n "Simple Filter" -t test.ttl -b simple-filter.so -c 2 -p "-n foo -s foo" -p "-n bar -s bar" >> test_manifest.ttl

lv2_validate test_manifest.ttl


