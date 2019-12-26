require "pry"
class Triangle
  attr_reader :x,:y,:z
  def initialize(x,y,z)
    @x = x
    @y = y
    @z = z
  end

  class TriangleError < StandardError
    def message1
      "triangles violating triangle inequality are illegal"
    end
    def message2
      "triangles with negative sides are illegal"
    end
    def message3
      "knows that triangles with no size are illegal"
    end
  end


  def kind
   
    if x < 0 || y < 0 || z < 0
      begin 
        raise TriangleError
      #   raise TriangleError 
      # rescue TriangleError => obj
      #   return obj.message2
      end
    elsif x == 0 || y == 0 || z == 0 || x == 0.0 || y == 0.0 || z == 0.0
      begin 
        # binding.pry
        raise TriangleError
        # binding.pry
      # rescue TriangleError => obj
      #   # binding.pry
      #   puts obj.message3
      end
    elsif (x+y) <= z || (y+z) <= x || (x+z) <= y
      begin 
        raise TriangleError 
      # rescue TriangleError => obj
      #   puts obj.message1
      end
    elsif x == y && y ==z
      return :equilateral
    elsif x == y || y == z || x == z
      return :isosceles
    else
      return :scalene
    end
  end




  
end
