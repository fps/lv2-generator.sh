# set -e
set -x 

echo Generating ttl

./lv2-ttl-generator.sh -m ttl -u http://fps.io/example -o http://fps.io -n "Example Plugin Test" -b example.so -c 2 -p "-n Gain -s gain -d 0.5 -i -0.001 -x 1.0 -l" -p '-n "Cutoff Frequency" -s cutoff -i 1.0 -x 20000.0 -d 2000.0 -h' > test.ttl

lv2_validate test.ttl

echo Generating manifest

./lv2-ttl-generator.sh -m manifest-prefix  > test_manifest.ttl
./lv2-ttl-generator.sh -m manifest -u http://fps.io/example -t test.ttl >> manifest.ttl

lv2_validate manifest.ttl


