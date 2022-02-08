class Canvas
  attr_accessor :width, :height, :color

  def initialize(width = 100, height = 100, color = :black)
    @width = width
    @height = height
    @color = color
  end

  def draw_rect(x, y, width, height)
    # draws a rectangle
  end

  def to_s
    "#{@width}x#{@height} #{@color} canvas"
  end
end

canvas = Canvas.new(800, 600, :green)
puts canvas

