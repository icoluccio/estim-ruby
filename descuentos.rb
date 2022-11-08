# frozen_string_literal: true

module Descuento
  class Directo
    attr_accessor :porcentaje

    def initialize(porcentaje)
      self.porcentaje = porcentaje
    end

    def precio(juego)
      juego.precio * (1 - multiplicador)
    end
  end
end

module Descuento
  class Fijo
    attr_accessor :descuento_fijo

    def initialize(descuento_fijo)
      self.descuento_fijo = descuento_fijo
    end

    def precio(juego)
      (juego.precio - descuento_fijo).max(juego.precio / 2)
    end
  end
end

module Descuento
  class Gratis
    def precio(_juego)
      0
    end
  end
end

module Descuento
  class PorJuegosEnEstim < Fijo
    def precio(juego)
      juego - (Estim.juegos.size + super).max(50) - super
    end
  end
end
