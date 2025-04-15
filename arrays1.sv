//static-fixed-single-dimensional-array
module static_fixed-single-dim;
 int array[5] = { 2,3,4,5,6};

 initial begin
   $display("array[0]",array[0]);
   foreach (array[i]) begin
      $display("array[%0d] = %0d", i, array[i]);
   end
 end 
endmodule

//static-fixed-multi-dimensional-array
module static_fixed-multi-dim;
 //int array[5][2] = `{`{1, 2},`{2,3},`{3,4},`{4,5},`{5,6}};

 // unpacked array of packed array elements
 bit [5:0] array[4:0][1:0];  // packed 6bits array of size 10-unpacked-array elements
 // Initialize the above
 array=`{`{`h2,`h3},`{`h4,`h5},`{`h6,`h2},`{`h3,`h4},`{`h5,`h6}};
 initial begin
   foreach (array[i,j]) begin
      $display("array[%0d][%0d] = %0d", i, j, array[i][j]);
   end
 end 
endmodule

//Packed Array
module packed_array;
 bit [2:0][3:0] array; //Not a 2 dim array, but 12-bit-packed array
 // Initialize the above
 //array = {4'h2, 4'h4, 4'h7};
 array = {12'h5FF}
 initial begin
   foreach (array[i]) begin
      $display("array[%0h] = %0h", i, array[i]);
   end
 end 
endmodule

//Unpacked Array
module unpacked_array;
 bit array [3][4]; //3rowsx4cols
 // Initialize the above
 array = `{`{1,2,3,4},
           `{5,6,7,8},
           `{9,10,11,12}};
 initial begin
   foreach (array[i][j]) begin
      $display("array[%0d][%0d] = %0d", i, j, array[i][j]);
   end
 end 
endmodule

//Combination of Packed and Unpacked Array
module combo_packed_unpacked_array;
 bit [4:0] array [2:0][1:0]; //3x2 array, each of 5-bits wide.
 // Initialize the above
 array = `{`{5'h5,5'h1},
           `{5'h2,5'h6},
           `{5'h9,5'hA}};
 initial begin
   foreach (array[i][j]) begin
      $display("array[%0d][%0d] = %0d", i, j, array[i][j]);
   end
 end 
endmodule

//Ex2 - Combination of Packed and Unpacked Array - Bit will be truncated
module combo_packed_unpacked_array;
 bit [0:1][0:1] array [0:2][0:1]; //3x2 array, each of 5-bits wide.
 // Initialize the above
 array = `{{20,10}, //Dec:20 => Hex 14. Here 4 will get printed and other significant bits are truncated
           {5,7},
           {2,1}};
 initial begin
   foreach (array[i][j]) $display("array[%0d][%0d] = %0d", i, j, array[i][j]);
 end 
endmodule

// Dynamic Arrays
module dynamic_array;
 int array[];
 initial begin
   array=new[5];
   array=`{5, 4, 3, 2, 1};
   //Print Size of the array 
   $display("size of array = %0d", array.size());
   $display("%0p", array);

   //Resize-by-retain and Print size of the array 
   array=new[8] (array);
   $display("size of array after resizing = %0d", array.size());
   $display("%0p", array);

   //Resize-by-overwrite and Print size of the array 
   array = new[10];
   $display("size of array after resizing = %0d", array.size());
   $display("%0p", array);

   foreach (array[i]) $display("array[%0d] = %0d", i, array[i]);

   array.delete();
   $display("size of array after resizing = %0d", array.size());
 end 
endmodule

// Associative Arrays
module associative_array;
 bit [7:0] array [int];
 int index;

 initial begin
   array[5] = 2;
   array[15] = 5;
   array[12] = 15;
   array[10] = 12;
   array[11] = 10;
   array[6] = 11;
   array[0] = 6;
   array=`{5, 4, 3, 2, 1};

   foreach (array[i]) $display("array[%0d] = %0d", i, array[i]);

   //Print Size of the array  and number of entries in array
   $display("size of array = %0d, number of entries = %0d", array.size(), array.num());
   $display("-------------------------------------------------------");

   //exists() method
   if(array.exists(6)) $display("An element exists at index 6");
   else $display("An element does not exists for given index");

   //exists() method
   if(array.exists(7)) $display("An exelemt exists at index 7");
   else $display("An element does not exist at index 7");
   $display("-------------------------------------------------------");

   //first() last() next() and prev() methods
   array.first(index);
   $display("First index of array = %0d", index);
   array.last(index);
   $display("Last index of array = %0d", index);

   index = 9;
   array.prev(index);
   $display("Prev index of array = %0d", index);
   array.next(index);
   $display("Next index of array = %0d", index)
   $display("-------------------------------------------------------");

   //In Assocarray delete(index) is allowed,unlike deletion of full-array itself
   array.delete(7);
   $display("After deletion of an index(7) value of the array: ");
   foreach (array[i]) $display("array[%0d] = %0d", i, array[i]);
   $display("-------------------------------------------------------");

   //Full array deletion
   array.delete();
   $display("size of array = %0d, number of entries = %0d", array.size(), array.num());
   $display("-------------------------------------------------------");

 end 
endmodule

/////////////////////////////////////////////////////////////////////
//    Array manipulation methods
/////////////////////////////////////////////////////////////////////

// Element Locator Methods
module element_locator_methods;
   int attay[8]={1,2,3,4,5,6,7,8};
   int res[$];
   initial begin
      res=array.find(x) with (x>4);
      $display("find(x): %0p", res);
      res=array.find_first with (item<3 & item<6);
      $display("find_first: %0p", res);
      res=array.find_last with (item<7 & item>=1);
      $display("find_last: %0p", res);

      res=array.min();
      $display("min: %0p", res);
      res=array.max();
      $display("max: %0p", res);
      res=array.unique();
      $display("unique: %0p", res);
   end
endmodule
      //---------------------------------------------------//

//  Array index locator Methods
module reduction_methods;
   int attay[8]={1,2,3,4,5,6,7,8};
   int res[$];
   initial begin
      res=array.find_index(x) with (x>4);
      $display("find_index(x): %0p", res);
      res=array.find_index_first with (item>7 & item<9);
      $display("find_index_first: %0p", res);
      res=array.find_index_last with (itemr>6);
      $display("find_index_last: %0p", res);

      res=array.unique_index();
      $display("unique: %0p", res);
   end
endmodule
      //---------------------------------------------------//

// Index reduction Methods
module index_locator_methods;
   int attay[8]={1,2,3,4,5,6,7,8};
   initial begin
      $display("array_sum=%0d", array.sum);
      $display("array_product=%0d", array.product);
      $display("array_AND=%0d", array.and);
      $display("array_OR=%0d", array.or);
      $display("array_XOR=%0d", array.xor);
   end
endmodule
      //---------------------------------------------------//

//  Array Ordering Methods
module ordering_methods;
   int attay[8]={1,2,3,4,5,6,7,8};
   initial begin
      $display("before sort :%0p", array);
      array.sort();
      $display("after sort :%0p", array);
      $display("before rsort :%0p", array);
      array.rsort();
      $display("after rsort :%0p", array);
      $display("before shuffle :%0p", array);
      array.shuffle();
      $display("after shuffle :%0p", array);
      $display("before reverse :%0p", array);
      array.reverse();
      $display("after reverse :%0p", array);
      
   end
endmodule
