module Enumerable
  def my_each_with_index
    if block_given?
      (0...self.length).each { |i|
        yield(self[i], i)
      }
    end

    self
  end

  def my_select
    result = []

    if block_given?
      self.my_each do |element|
        result << element if yield(element)
      end
    end

    result
  end

  def my_all?
    if block_given?
      self.my_each do |element|
        yield(element) ? next : (return false)
      end
    end

    true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    if block_given?
      self.each do |element|
        yield(element)
      end
    end

    self
  end
end
