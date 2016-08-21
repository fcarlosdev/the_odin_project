$LOAD_PATH << '.'
require 'node.rb'

class LinkedList

    def initialize(value)
      @head = Node.new(value,nil)
      @tail = @head
    end

    def append(value)
      @tail.next_node = Node.new(value, nil)
      @tail = @tail.next_node
    end

    def prepend(value)
      first_node = Node.new(value,@head)
      @head = first_node
    end

    def size
      node = @head
      total = 0
      while node != nil
        total += 1
        node = node.next_node
      end
      return total
    end

    def head
      return @head
    end

    def tail
      return @tail
    end

    def at(index)
      node = @head
      node_at_index = nil
      pos = 0
      while node != nil
        return node if pos == index
        pos += 1
        node = node.next_node
      end
    end

    def pop
      @tail = self.at(self.size-2)
      @tail.next_node = nil
    end

    def contains?(value)
      (0..self.size-1).each do |index|
        return true if self.at(index).value.to_s.downcase == value.downcase
      end
      return false
    end

    def find(data)
      (0..self.size-1).each do |index|
        return index if self.at(index).value.to_s.downcase == data.downcase
      end
      return nil
    end

    def to_s
      node = @head
      list_to_s = ""
      while node != nil
        if node.next_node != nil
          list_to_s << "(#{node.value}) -> "
        else
          list_to_s << "(#{node.value}) -> nil"
        end
        node = node.next_node
      end
      return list_to_s
    end

    def insert_at(index,data)
      if index == 0
        self.prepend(data)
      elsif index = self.size
        self.append(data)
      else
        self.at(index-1).next_node = Node.new(data,self.at(index))
      end
    end

    def remove_at(index)
      if index < 0 || index > self.size
        puts "Invalid index"
      elsif index == 0
        @head = self.at(index+1)
      elsif index == self.size
        self.pop
      else
        self.at(index-1).next_node = self.at(index).next_node
      end
    end

end
