class Image

  def initialize(pic)
    @pic = pic
    @row_length = pic.length
    @col_length = pic[0].length
  end

  def output_image
    @pic.each do |row|
      puts row.join
    end
  end

  def blur_image(row_index, col_index)
    @pic[row_index -1][col_index] = 1 unless row_index == 0
    @pic[row_index +1][col_index] = 1 unless row_index >= @row_length-1
    @pic[row_index][col_index -1] = 1 unless col_index == 0
    @pic[row_index][col_index +1] = 1 unless col_index >= @col_length-1
  end

  def find_ones
    one_pixel = []

    @pic.each_with_index do |row_array, row_index|
        row_array.each_with_index do |cell, col_index|
        if cell == 1
          one_pixel << [row_index, col_index]
        end
      end
    end    
    one_pixel  
  end

  def transform
    blur_coord = find_ones

    blur_coord.each do |x, y|
      blur_image(x, y)
    end  
  end

  def blur(distance=1)
    distance.times do
      transform
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])


image.output_image

image.blur
puts
image.output_image

image.blur
puts
image.output_image
