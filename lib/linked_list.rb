# frozen_string_literal: false

# Node class thats used for node creation
class Node
  attr_accessor :value, :next

  def initialize
    @value = nil
    @next = nil
  end
end

# Linked_list class that holds the whole linked list
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new

    node.value = value

    if !tail.nil?
      @tail.next = node
      @tail = node
      node.next = nil
    else
      @tail = node
      node.next = @tail.next
    end

    return unless @head.nil?

    @head = node
  end

  def prepend(value)
    node = Node.new

    node.value = value

    node.next = @head
    @head = node

    return unless @tail.nil?

    @tail = node
    node.next = nil
  end

  def size(current_node = @head, coun = 0)
    if head.nil?
      coun
    elsif current_node.next.nil?
      coun += 1
      coun
    else
      coun += 1
      current_node.next
      size(current_node.next, coun)
    end
  end

  def at(index, current_node = @head, coun = 0)
    if index > (size - 1)
      nil
    elsif coun == index
      current_node
    else
      coun += 1
      at(index, current_node.next, coun)
    end
  end

  def pop(current_node = @head)
    if current_node.next == @tail
      @tail = nil
      current_node.next = @tail
      @tail = current_node
    else
      pop(current_node.next)
    end
  end

  def contains?(value, current_node = @head)
    if current_node.value == value
      true
    elsif current_node.next.nil?
      false
    else
      contains?(value, current_node.next)
    end
  end

  def find(value, index = 0, current_node = @head)
    if current_node.value == value
      index
    elsif current_node.next.nil?
      nil
    else
      index += 1
      find(value, index, current_node.next)
    end
  end

  def to_s(current_node = head, str = '')
    if current_node.next.nil?
      str << "(#{current_node.value}) -> nil"
      str
    else
      str << "(#{current_node.value}) -> "
      to_s(current_node.next, str)
    end
  end
end

linked_list = LinkedList.new

linked_list.append(80)

linked_list.prepend(70)

linked_list.append(60)

linked_list.prepend(100)

# p linked_list.head
# p linked_list.tail

p linked_list.to_s