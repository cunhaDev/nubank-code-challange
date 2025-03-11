class ImpostoCalculator
  attr_accessor :quantidade_acoes, :preco_medio, :prejuizo_acumulado

  def initialize
    @quantidade_acoes = 0
    @preco_medio = 0.0
    @prejuizo_acumulado = 0.0
  end

  def calcular_imposto(operacoes)
    resultado = []

    operacoes.each do |operacao|
      if operacao.tipo == "buy"  
        resultado << { tax: 0.00 }
        processar_compra(operacao)
      elsif operacao.tipo == "sell" 
        resultado << { tax: calcular_imposto_venda(operacao) }
        processar_venda(operacao)
      end
    end

    resultado
  end

  private

  def processar_compra(operacao)
    total_pago = operacao.quantidade * operacao.preco_unitario  
    @preco_medio = ((@quantidade_acoes * @preco_medio) + total_pago) / (@quantidade_acoes + operacao.quantidade)
    @quantidade_acoes += operacao.quantidade
  end

  def calcular_imposto_venda(operacao)
    total_venda = operacao.quantidade * operacao.preco_unitario 
    lucro = (operacao.preco_unitario - @preco_medio) * operacao.quantidade

    if lucro < 0
      @prejuizo_acumulado += lucro.abs
      return 0.00
    elsif total_venda <= 20000
      return 0.00
    else
      return calcular_imposto_lucro(lucro)
    end
  end

  def calcular_imposto_lucro(lucro)
    if @prejuizo_acumulado > 0
      if @prejuizo_acumulado >= lucro
        @prejuizo_acumulado -= lucro
        return 0.00
      else
        lucro -= @prejuizo_acumulado
        @prejuizo_acumulado = 0
        return (lucro * 0.20).round(2)
      end
    else
      return (lucro * 0.20).round(2)
    end
  end

  def processar_venda(operacao)
    @quantidade_acoes -= operacao.quantidade
  end
end