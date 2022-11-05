# frozen_string_literal: true

class Porcentajeador
  def self.porcentaje(cosas, &bloque)
    cuantas = cosas.select(&bloque).size.to_f
    total = cosas.size
    puts cuantas
    puts total
    cuantas / total
  end
end
