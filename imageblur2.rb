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

  def blur!
    coordinates = get_coordinates
      @image.each_with_index do |row, y|
        row.each_with_index do |value, x|
          coordinates.each do |found_y, found_x|

            if y == found_y && x == found_x
              @image[y -1][x] = 1 unless y == 0 #up
              @image[y +1][x] = 1 unless y >= 3 #down
              @image[y][x -1] = 1 unless x == 0 #left
              @image[y][x +1] = 1 unless x >= 3 #right
            end
          end
        end
      end
  end

  def output_image
    @image.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.output_image
puts
image.blur!

image.output_image