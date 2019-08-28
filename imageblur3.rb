class Image

    def initialize (image)
        @image = image
    end

    def get_coordinates
        coordinates = []
        @image.each_with_index do |row, y|
          row.each_with_index do |value, x|
            if value == 1
                coordinates<<[y, x]
            end    
          end
        end
        return coordinates
    end

  def blur!(blur_distance)
    coordinates = get_coordinates
      @image.each_with_index do |row, y|
        row.each_with_index do |value, x|
          coordinates.each do |found_y, found_x|
          if manhattan_distance(x, y, found_x, found_y) <= blur_distance
            @image[y][x] = 1
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    horizontal_distance + vertical_distance
  end

  def output_image
    @image.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])


image.output_image
puts


image.blur!(2)
image.output_image