require 'sqlite3'
require "./clase"


def conn
  begin
    db = SQLite3::Database.new "horario_ceutec.db"
  rescue SQLite3::Exception => e
    puts "Exception occurred: #{e}"
  end
  db
end

def insert_clase(code, name)
  stm = conn.prepare "INSERT INTO Clase(Codigo, Nombre) VALUES (?, ?)"
  stm.bind_param 1, code
  stm.bind_param 2, name
  stm.execute
  puts "se ha insertado la nueva clase de #{name} con código #{code}"
end

def insert_section(section)
  stm = conn.prepare "INSERT INTO Secciones VALUES (?,?,?,?,?,?,?,?)"
  stm.bind_param 1, section.seccion
  stm.bind_param 2, section.codigo
  stm.bind_param 3, section.nombre
  stm.bind_param 4, section.hora
  stm.bind_param 5, section.aula
  stm.bind_param 6, section.dias
  stm.bind_param 7, section.cupos
  stm.bind_param 8, section.docente
  stm.execute
  puts "Insertado -> #{section.to_s}"
end

def insert_section_box(box, v)
  conn.execute "INSERT INTO Secciones VALUES (?,?,?,?,?,?,?,?)", box
  if v
    puts "Insertado -> #{box}"
  end
end

def delete_sections
  conn.execute("DELETE FROM Secciones")
  puts "Se han eliminado las secciones"
end
