require "pry"

class Triangle
  attr_reader :length, :width, :height, :kind

  def initialize(length, width, height)
    @length = length
    @width = width
    @height = height
    @kind = self.kind
  end

  def kind
    if illegal?
      raise TriangleError
    end

    if (length == width) && (width == height)
      kind = :equilateral
    elsif (length == width) || (width == height) || (length == height)
      kind = :isosceles
    else
      kind = :scalene
    end
  end

  def yes_equality?
    if @length + @width <= @height
      return false
    end

    if @length + @height <= @width
      return false
    end

    if @height + @width <= @length
      return false
    end

    true
    
  end

  def illegal?
    if (@length <= 0) || (@width <= 0) || (@height <= 0) || !yes_equality?
      return true
    end
    return false
  end

  class TriangleError < StandardError
    def message
      puts "all sides must have a value greater than 0"
    end
  end
end
