class LimitedStack{
 
      var capacity : int; // capacity, max number of elements allowed on the stack.
      var arr : array?<int>; // contents of stack.
      var top : int; // The index of the top of the stack, or -1 if the stack is empty

      // This predicate express a class invariant: All objects of this calls should satisfy this.
      predicate Valid()
      reads this;
      {   arr!=null && 0<capacity<=arr.Length &&  -1<=top<capacity 
      }

      predicate Empty()
      reads this;
      {   top==-1
      }

      predicate Full()
      reads this;
      {   top==capacity-1
      }
      
      // initializing stack
      method Init(c : int)
      modifies this;
      requires arr==null;
      requires c>0;
      ensures fresh(arr); 
      ensures Valid();
      ensures capacity==c;
      ensures top==-1;
      ensures arr.Length==c;
      {
        capacity := c;
        arr := new int[c];
        top := -1;
      }

      // getting the top  of stack
      method Peek() returns (elem : int)
      requires Valid();
      requires !Empty();
      ensures elem==arr[top];
      {
          elem := arr[top];
      }
      
      // pushing to the top of non full stack
      method Push(elem : int)
      modifies this.arr,this;
      requires Valid();
      requires !Full();
      ensures Valid();
      ensures !Empty();
      ensures arr[top]==elem;
      //ensures forall i:: 0<=i<top ==> old(arr[i])==arr[i];
      {   top := top+1;
          arr[top] := elem;
      }
}
