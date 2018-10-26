
PROPIEDADES = 8

def get_information
  info = []
  File.open('secciones.txt', 'r') do |f1|
    i = 0
    while linea = f1.gets
      info[i] = linea.tr("\n", "")
      i += 1
    end
  end
  info.delete("\n")
  info.last(info.length - 22)
end

def information_to_boxes(info)
  boxes = Array.new(info.size / 8)
  index = 0
  contador = 0
  for i in (0..info.size) do

    if contador == 0
      boxes[index] = Array.new(PROPIEDADES)
    end
    boxes[index][contador] = info[i]
    contador += 1
    if contador == 8
      contador = 0
      index += 1
    end
  end
  boxes.pop
  boxes
end

def print_and_flush(str)
  print str
  $stdout.flush
end

def printMatrix(matrix)
  matrix.each do |clase|
    clase.each do |elemento|
      print_and_flush "#{elemento} - "
    end
    puts ""
  end
end

def print_information(info)
  (0...info.length).each do |it|
    puts "#{it}. #{info[it]}"
  end
end


