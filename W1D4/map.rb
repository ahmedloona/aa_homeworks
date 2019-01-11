class Map

  attr_accessor :store

  def initialize
    @store = Array.new
  end

  def set(key, value)
    duplicate_idx = find_index(key)
    unless duplicate_idx
      self.store.push([key, value])
    else
      self.store[duplicate_idx] = [key, value]
    end
    self
  end

  def find_index(key)
    self.store.each_with_index do |pair, idx|
      return idx if key == pair.first
    end
    nil
  end

  def get(key)
    key_index = find_index(key)
    key_index ? self.store[key_index] : nil
  end

  def delete(key)
    key_index = find_index(key)
    self.store.delete_at(key_index)
  end

  def show
    self.store
  end

end
