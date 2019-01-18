class LRUCache
  attr_reader :store, :size
  def initialize
    @store = []
  end

  def count
    # returns number of elements currently in cache
    self.store.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    unless self.store.include?(el)
      self.store.shift if self.store.length == 4
      self.store << el
    else
      index = self.store.delete(el)
      self.store << el
    end

  end

  def show
    # shows the items in the cache, with the LRU item first
    print self.store
  end

  private
  # helper methods go here!

end
