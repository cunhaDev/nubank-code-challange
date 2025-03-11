require 'rspec'
require_relative '../src/models/imposto_calculator'
require_relative '../src/models/operacao'

describe ImpostoCalculator do
  let(:calculator) { ImpostoCalculator.new }

  context 'compras de ações' do
    it 'não deve gerar imposto ao comprar ações' do
      operacoes = [Operacao.new("buy", 10.0, 100)]
      resultado = calculator.calcular_imposto(operacoes)
      expect(resultado).to eq([{ tax: 0.00 }])
    end
  end

  context 'vendas de ações' do
    before do
      calculator.calcular_imposto([Operacao.new("buy", 10.0, 100)])
    end

    it 'não deve gerar imposto se a venda for menor ou igual a 20.000' do
      operacoes = [Operacao.new("sell", 15.0, 100)] 
      resultado = calculator.calcular_imposto(operacoes)
      expect(resultado).to eq([{ tax: 0.00 }])
    end

    it 'deve calcular imposto corretamente quando há lucro acima do limite de isenção' do
      calculator.calcular_imposto([Operacao.new("buy", 10.0, 100)])
      operacoes = [Operacao.new("sell", 300.0, 100)] 
      resultado = calculator.calcular_imposto(operacoes)
      expect(resultado).to eq([{ tax: 5800.00 }]) 
    end
  end

  context 'prejuízo acumulado' do
    before do
      calculator.calcular_imposto([Operacao.new("buy", 50.0, 100)])
      calculator.calcular_imposto([Operacao.new("sell", 30.0, 100)]) 
    end

    it 'deve acumular prejuízo e não cobrar imposto na próxima venda' do
      expect(calculator.prejuizo_acumulado).to eq(2000.0)
      operacoes = [Operacao.new("sell", 70.0, 100)] 
      resultado = calculator.calcular_imposto(operacoes)
      expect(resultado).to eq([{ tax: 0.00 }])
    end
  end
end