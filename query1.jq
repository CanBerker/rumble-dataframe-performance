for $o in json-file("./dataset/confusion-2014-03-02.json")
let $t := $o.target
let $g := $o.guess
where $t eq $g and $t eq "Russian"
return $o
