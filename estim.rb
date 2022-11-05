# frozen_string_literal: true

class Estim
  DESCUENTO_MASIVO = 25
  attr_accessor :juegos

  def juego_mas_caro
    juegos.max(&:precio_bruto)
  end

  def limite_para_descuento_masivo
    juego_mas_caro * 0.75
  end

  def juegos_caros
    juegos.select { |juego| juego.vale_mas_que(limite_para_descuento_masivo) }
  end

  def aplicar_descuento_masivo
    juegos_caros.each { |juego| juego.descuento(Descuento::Directo.new(DESCUENTO_MASIVO)) }
  end

  def promedio_de_precio_para_menores(_pais)
    juegos = juegos_para_menores
    juegos.sum(&:precio) / juegos.count
  end

  def algun_juego_galardonado
    juegos.any?(&:todo_positivo?)
  end
end
