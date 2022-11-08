# frozen_string_literal: true

class Critica
  MINIMO_PARA_LITERARIO = 100
  attr_accessor :contenido, :positiva

  def initialize(contenido, positiva)
    self.contenido = contenido
    self.positiva = positiva
  end

  def es_literaria?
    contenido.size > MINIMO_PARA_LITERARIO
  end
end

class Critico
  def criticar(juego)
    juego.agregar_critica!(escribir_critica(juego))
  end

  def escribir_critica(juego)
    Critica.new(texto, critica_positiva?(juego))
  end

  def texto; end

  def critica_positiva?(juego); end
end

class Usuario
  attr_accessor :actitud_positiva

  def initialize(actitud_positiva)
    self.actitud_positiva = actitud_positiva
  end

  def critica_positiva?(_juego)
    actitud_positiva
  end

  def texto
    critica_positiva? ? 'SI' : 'NO'
  end
end

class CriticoPago
  PALABRAS = %w[asdf dfsadf].freeze # Usar faker
  attr_accessor :juegos_pagos

  def critica_positiva?(juego)
    juegos_pagos.include?(juego)
  end

  def texto
    PALABRAS.sample(5).join(' ')
  end
end

class Revista
  attr_accessor :criticos

  def critica_positiva?(juego)
    porcentaje = Porcentajeador.porcentaje(criticos) { |critico| critico.critica_positiva?(juego) }
    porcentaje >= 0.5
  end

  def texto
    criticos.reduce('') { |critico, critica_conjunta| [critica_conjunta, critico.texto].join(' ') }
  end
end
