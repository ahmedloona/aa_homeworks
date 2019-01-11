class Stack

  attr_accessor :stack

  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    self.stack.push(el)
  end

  def pop
    # removes one element from the stack
    self.stack.pop unless stack.empty?
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    self.stack[-1] unless stack.empty?
  end
end
