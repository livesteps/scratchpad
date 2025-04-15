// known about arrays

module queues_array;
//declaration
bit [31:0] queue[$]; //UnBounded queue

initial begin
   //init queue
   queue = {0,1,2,3};

   //size-method
   $display("\tqueue elements: %0p", queue);
   $display("\tqueue elements: %0d", queue.size());
   //push_front method
   queue.push_front('h22);
   $display("\tqueue elements: %0p", queue);
   $display("\tqueue elements: %0d", queue.size());
   //push_back method
   queue.push_back('h44);
   $display("\tqueue elements: %0p", queue);
   $display("\tqueue elements: %0d", queue.size());
   //pop_front method
   queue.pop_front();
   $display("\tqueue elements: %0p", queue);
   $display("\tqueue elements: %0d", queue.size());
   //pop_back method
   queue.pop_back();
   $display("\tqueue elements: %0p", queue);
   $display("\tqueue elements: %0d", queue.size());
   //insert method
   queue.insert(4,4);
   $display("\tqueue elements: %0p", queue);
   $display("\tqueue elements: %0d", queue.size());
   //shuffle method
   $display("\tqueue elements before shuffle: %0p", queue);
   queue.shuffle(4,4);
   $display("\tqueue elements after shuffle: %0p", queue);
   $display("\tqueue elements: %0d", queue.size());

   //delete method
   queue.delete(3);
   $display("\tqueue elements after 3rd index deletd : %0d", queue.size());
   queue.delete();
   $display("\tqueue elements after fully deletd : %0d", queue.size());
end
endmodule
//----------------------------------------------------

module queues_array;
//declaration
bit [31:0] queue[$:3]; //Bounded queue

initial begin
   //init queue
   queue = {0,1,2,3};

   //size-method
   $display("\tqueue elements: %0p", queue);
   $display("\tqueue elements: %0d", queue.size());
   //push_front method
   queue.push_front(8);
   $display("\tqueue elements: %0p", queue);
   //push_back method
   queue.push_back(8);   // This is illegal but no errors occurs
   $display("\tqueue elements: %0p", queue);
   //pop_front method
end
endmodule
