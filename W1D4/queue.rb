class Queue

  attr_accessor :queue
  def initialize
    # create ivar to store stack here!
    @queue = []
  end

  def enqueue(el)
    # adds an element to the stack
    self.queue.push(el)
  end

  def dequeue
    # removes one element from the stack
    self.queue.shift
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    self.queue[0]
  end
end
