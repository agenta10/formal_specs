class Counter {
 
  var value : int ;
  
  constructor init()
  ensures value ==0; 
  {
    value := 0 ;
  }
  
  method getValue() returns (x:int)
  ensures x==value;
  {
    x := value ;
  }
  
  method inc()
  modifies `value;
  requires value>=0;
  ensures old(value)==value-1;
  ensures value>0;
  {
    value := value + 1;
  }
  
  method dec()
  modifies `value;
  requires value>0;
  ensures old(value)==value+1;
  ensures value>=0;
  { 
    value := value - 1 ;
  }
  
  method Main ()
  {
   var count := new Counter.init() ;
   count.inc();
   count.inc();
   count.dec();
   count.inc();
   var aux : int := count.getValue();
   assert (aux == 2) ;
  }
}
