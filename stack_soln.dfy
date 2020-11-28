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
      
      
      method Init(c : int)
      modifies this;
      requires arr==null;
      requires c>0;
      ensures fresh(arr); 
      ensures Valid();
      ensures capacity==c;
      ensures top==-1;
      {
        capacity := c;
        arr := new int[c];
        top := -1;
      }

      method Peek() returns (elem : int)
      requires Valid();
      requires !Empty();
      ensures elem==arr[top];
      {
          elem := arr[top];
      }
}
