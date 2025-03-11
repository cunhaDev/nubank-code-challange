class Operacao
  attr_accessor :tipo, :preco_unitario, :quantidade

  def initialize(tipo, preco_unitario, quantidade)
    @tipo = tipo
    @preco_unitario = preco_unitario
    @quantidade = quantidade
  end
end
