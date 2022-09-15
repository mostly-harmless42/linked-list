
# Linked Lists
Created as part of [The Odin Project](https://www.theodinproject.com) curriculum.

View on [Github](https://github.com/mostly-harmless42/linked-list)

## Functionality

This is the [linked list](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/linked-lists) project, which introduces linked lists as data structures.

## Methods

| Method        | Description   |
| ------------- |:-------------|
| #add(value, to_front) | A helper method for #append and #prepend |
| #append(value) | Adds a new node containing value to the end of the list |
| #prepend(value) | Adds a new node containing value to the beginning of the list |
| #size | Returns the total number of nodes in the list |
| #head | Returns the first node in the list |
| #tail | Returns the last node in the list |
| #at(index) | Returns the node at the given index  |
| #pop | Removes the last element from the list and returns its value |
| #contains?(value) | Returns true if a node containing value is in the list, otherwise returns false |
| #find(value) | Returns the index of the node containing value, otherwise returns nil |
| #to_s | Represent your LinkedList objects as strings, so you can print them out and preview them in the console |
| #insert_at(value, index) | Inserts a new node with containing value at the given index |
| #remove_at(index) | Removes the node at the given index |

## Thoughts

A fun introduction to data structures! It is surprisingly simple to create a singly linked list with objects. Made a version with and without implementation of Ruby's #each method from Enumerable, which I used to simplify code for the #size, #at, #contains?, #find(value), and #to_s methods. 