# frozen_string_literal: true

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

    node.next = @tail
    @tail = node

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
    node.next = tail
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
end

linked_list = LinkedList.new

linked_list.append(80)

linked_list.prepend(70)

# p linked_list.size

p linked_list.head
p linked_list.tail