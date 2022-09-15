require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize()
    @head = nil
    @tail = nil
  end

  def add(value, to_front = false)
    entry = Node.new(value)
    if @head.nil?
      @head = entry
      @tail = entry    
    elsif to_front
    entry.next_node = @head
    @head = entry
    else
      @tail.next_node = entry
      @tail = entry
   end
  end

  def append(value)
    self.add(value)
  end

  def prepend(value)
    self.add(value, to_front = true)
  end

  def size
    entry = @head
    count = 0
    until entry.nil?
      entry = entry.next_node
      count += 1
    end
    count
  end

  def at(index)
    return nil if index < 0
    entry = @head
    index.times do
      return nil if entry.nil?
      entry = entry.next_node
    end
    entry
  end

  def pop
    return nil if @head.nil?
    entry = @tail
    if self.size == 1
      @head = nil
      @tail = nil
    else 
      @tail = self.at(self.size - 2)
      @tail.next_node = nil
    end
    entry
  end

  def contains(value)
    entry = @head
    until entry.nil?
      return true if entry.value == value
      entry = entry.next_node
    end
    false
  end

  def find(value)
    entry = @head
    count = 0
    until entry.nil?
      return count if entry.value == value
      entry = entry.next_node
      count += 1
    end
    nil
  end

  def to_s
    str = ""
    entry = @head
    until entry.nil?
      str += "(#{entry.value}) -> "
      entry = entry.next_node
    end
    str += "nil"
    str
  end

  def insert_at(value, index)
    return if index < 0
    if index == 0
      self.add(value, to_front = true)
    elsif index >= self.size
      self.append(value)
    else
      next_entry = self.at(index)
      self.at(index - 1).next_node = Node.new(value)
      self.at(index).next_node = next_entry
    end
  end

  def remove_at(index)
    return if index < 0 || index > self.size
    index == 0 ? @head = @head.next_node : self.at(index - 1).next_node = self.at(index + 1)
  end
end
