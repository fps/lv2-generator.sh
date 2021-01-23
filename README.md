<pre>
./lv2-ttl-generator.sh -m ttl -u http://fps.io/example -n "Example Plugin" -b example.so -c 2 -p "-n Gain -s gain -d 0.5 -i -0.0 -x 1.0 -l" -p '-n "Cutoff Frequency" -s cutoff -i 1.0 -x 20000.0 -d 2000.0 -h'</pre>

results in:

```
@prefix lv2:  <http://lv2plug.in/ns/lv2core#> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix doap: <http://usefulinc.com/ns/doap#> .
@prefix units: <http://lv2plug.in/ns/extensions/units#> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix pprops: <http://lv2plug.in/ns/ext/port-props> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

<http://fps.io/example> a lv2:Plugin ;
  doap:name "Example Plugin" ;
  lv2:binary <example.so> ;
  lv2:port
  [
    a lv2:AudioPort ;
    a lv2:InputPort ;
    lv2:index 0 ;
    lv2:name "in1" ;
    lv2:symbol "in1" ;
  ]
  ,
  [
    a lv2:AudioPort ;
    a lv2:OutputPort ;
    lv2:index 1 ;
    lv2:name "out1" ;
    lv2:symbol "out1" ;
  ]
  ,
  [
    a lv2:AudioPort ;
    a lv2:InputPort ;
    lv2:index 2 ;
    lv2:name "in2" ;
    lv2:symbol "in2" ;
  ]
  ,
  [
    a lv2:AudioPort ;
    a lv2:OutputPort ;
    lv2:index 3 ;
    lv2:name "out2" ;
    lv2:symbol "out2" ;
  ]
  ,
  [
    a lv2:ControlPort ;
    a lv2:InputPort ;
    lv2:index 4 ;
    lv2:name "Gain" ;
    lv2:symbol "gain" ;
    lv2:default 0.5 ;
    lv2:minimum -0.0 ;
    lv2:maximum 1.0 ;
    lv2:PortProperty pprops:logarithmic ;
  ]
  ,
  [
    a lv2:ControlPort ;
    a lv2:InputPort ;
    lv2:index 5 ;
    lv2:name "Cutoff Frequency" ;
    lv2:symbol "cutoff" ;
    lv2:minimum 1.0 ;
    lv2:maximum 20000.0 ;
    lv2:default 2000.0 ;
    units:unit units:hz ;
  ]
  .
```
