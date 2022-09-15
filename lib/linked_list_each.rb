require_relative 'node'

class LinkedList
  include Enumerable
  attr_accessor :head, :tail

  def initialize()
    @head = nil
    @tail = nil
  end

  def each
    return nil if @head.nil?
    entry = @head
    until entry.nil?
      yield entry
      entry = entry.next_node
    end
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
    self.each_with_index { |entry, i| return i + 1 if entry.next_node.nil? }
  end

  def at(index)
    self.each_with_index { |entry, i| return entry if i == index}
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

  def contains?(value)
    self.each { |entry| return true if entry.value == value }
    false
  end

  def find(value)
    self.each_with_index { |entry, i| return i if entry.value == value }
    nil
  end

  def to_s
    str = ""
    self.each { |entry| str +=  "(#{entry.value}) -> " }
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

