<pre>
./lv2-ttl-generator.sh -u http://fps.io -n foo -b foo.so -c 2 -p "-n foo -s foo -d 0.0 -i -1.0 -x 1.0" > test.ttl
</pre>

results in:

<pre>
@prefix lv2:  <http://lv2plug.in/ns/lv2core#> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix doap: <http://usefulinc.com/ns/doap#> .
@prefix units: <http://lv2plug.in/ns/extensions/units#> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix pprops: <http://lv2plug.in/ns/ext/port-props> .

<http://fps.io> a lv2:Plugin ;
  doap:name "foo" ;
  lv2:binary <foo.so> ;
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
    lv2:name "foo" ;
    lv2:symbol "foo" ;
    lv2:default 0.0 ;
    lv2:minimum -1.0 ;
    lv2:maximum 1.0 ;
  ]
.
</pre>
