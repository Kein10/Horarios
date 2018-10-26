class Clase

  def initialize(arr)
    @seccion = arr[0]
    @codigo = arr[1]
    @nombre = arr[2]
    @hora = to24(arr[3])
    @aula = arr[4]
    @dias = arr[5]
    @cupos = arr[6]
    @docente = arr[7]
  end

  def to24(hora)
    if hora == "00:00"
      h = hora
    elsif /PM/.match(hora)
      h = hora.split(" ")[0].split(":")[0].to_i
      unless hora.split(" ")[0].split(":")[0].eql?("12")
        h += 12
      end
      h = h.to_s + ":" + hora.split(" ")[0].split(":")[1]
    else
      h = hora.split(" ")[0]
    end
  end

  attr_reader :seccion, :codigo, :nombre, :hora, :aula, :dias, :cupos, :docente

  def to_s
    "#{@seccion}, #{@codigo}, #{@nombre}, #{@hora}, #{@aula}, #{@dias}, #{@cupos}, #{@docente}. "
  end
end