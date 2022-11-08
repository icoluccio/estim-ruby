# frozen_string_literal: true

class Pais
  attr_accessor :cotizacion, :caracteristicas_prohibidas

  def precio(precio_bruto)
    cotizacion * precio_bruto
  end

  def puede_venderse(juego)
    caracteristicas_prohibidas.none? do |caracteristica|
      juego.incluye_caracteristica(caracteristica)
    end
  end
end
