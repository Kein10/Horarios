require './clase'
require './information'
require './data'
require './ProgressBar/progressbar'

class Main
  CARRERAS = ["Ingeniería en informática", "Enfermería"]
  @@secciones = []

  def inicio
    insertar_secciones
  end

  def boxes_to_sections boxes
    boxes.each do |box|
      @@secciones.push(Clase.new(box))
    end
  end

  def insertar_secciones
    delete_sections
    boxes = information_to_boxes get_information
    puts "Se registrarán #{boxes.size}. Esto puede llevar su tiempo...\n"
    pr = ProgressBar.new("Secciones", boxes.size)
    (0...boxes.size).each do |i|
      insert_section_box boxes[i], false
      pr.set(i)
    end
    pr.finish
  end
end

Main.new.inicio