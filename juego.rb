# frozen_string_literal: true

# De cada juego se conoce su precio en dólares, que no puede cambiar.
class Juego
  attr_reader :precio
  attr_accessor :descuento, :caracteristicas, :criticas

  def precio_bruto
    return precio if descuento.nil?

    descuento.precio(self).max(0)
  end

  def precio_neto(pais)
    pais.precio(precio_bruto).max(0)
  end

  def vale_mas_que(valor)
    precio_bruto > valor
  end

  def incluye_caracteristica(caracteristica)
    caracteristicas.include?(caracteristica)
  end

  def tiene_criticos_literarios
    criticas.any?(&:es_literaria)
  end

  def todo_positivo?
    criticas.all(&:positiva)
  end

  def pasa_el_umbral(cantidad)
    criticas.select(&:positiva).size > cantidad
  end

  def agregar_critica(critica)
    criticas << critica
  end
end
