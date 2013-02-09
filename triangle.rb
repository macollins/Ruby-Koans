# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

  sides = [a, b, c]
  raise TriangleError unless valid? sides

  if equilateral?(a, b, c)
    :equilateral
  elsif isosceles?(a, b, c)
    :isosceles
  else
    :scalene
  end
end

def equilateral?(a, b, c)
  a == b && b == c
end

def isosceles?(a, b, c)
  a == b || b == c || a == c
end

def valid?(sides)
  positive_length_sides?(sides) && sum_of_two_sides_exceed_third_side?(sides)
end

def positive_length_sides?(sides)
  sides.all? { |side| side >= 0 }
end

# Sum of any two sides of a triangle always exceed the length of the third side.
def sum_of_two_sides_exceed_third_side?(sides)
  sorted_sides = sides.sort
  sorted_sides[0] + sorted_sides[1] > sorted_sides[2]
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
