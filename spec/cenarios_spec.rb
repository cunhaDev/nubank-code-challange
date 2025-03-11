require 'rspec'
require_relative '../src/models/imposto_calculator'
require_relative '../src/models/operacao'

RSpec.describe ImpostoCalculator do
  let(:imposto_calculator) { ImpostoCalculator.new }

  it 'Testa cenario 1' do
    operacao_compra = Operacao.new('buy', 10.00, 100)
    operacao_venda_1 = Operacao.new('sell', 15.00, 50)
    operacao_venda_2 = Operacao.new('sell', 15.00, 50)
    resultado = imposto_calculator.calcular_imposto([operacao_compra, operacao_venda_1, operacao_venda_2])

    expect(resultado).to eq([
      { tax: 0.00 },      
      { tax: 0.00 },      
      { tax: 0.00 }       
    ])
  end

  it 'Testa cenario 2' do
    operacao_compra = Operacao.new('buy', 10.00, 10000)
    operacao_venda_1 = Operacao.new('sell', 20.00, 5000)
    operacao_venda_2 = Operacao.new('sell', 5.00, 5000)

    resultado = imposto_calculator.calcular_imposto([operacao_compra, operacao_venda_1, operacao_venda_2])

    expect(resultado).to eq([
      { tax: 0.00 },      
      { tax: 10000.00 }, 
      { tax: 0.00 }       
    ])
  end

  it 'Testa Cenario 1 + 2' do
    operacoes_1 = [
      Operacao.new('buy', 10.00, 100),
      Operacao.new('sell', 15.00, 50),
      Operacao.new('sell', 15.00, 50)
    ]
    resultado_1 = imposto_calculator.calcular_imposto(operacoes_1)
    expect(resultado_1).to eq([{ tax: 0.00 }, { tax: 0.00 }, { tax: 0.00 }])

    operacoes_2 = [
      Operacao.new('buy', 10.00, 10000),
      Operacao.new('sell', 20.00, 5000),
      Operacao.new('sell', 5.00, 5000)
    ]
    resultado_2 = imposto_calculator.calcular_imposto(operacoes_2)
    expect(resultado_2).to eq([{ tax: 0.00 }, { tax: 10000.00 }, { tax: 0.00 }])
  end

  it 'Testa Cenario 3' do
    operacoes = [
      Operacao.new('buy', 10.00, 10000),
      Operacao.new('sell', 5.00, 5000),
      Operacao.new('sell', 20.00, 3000)
    ]
    
    resultado = imposto_calculator.calcular_imposto(operacoes)

    expect(resultado).to eq([{ tax: 0.00 }, { tax: 0.00 }, { tax: 1000.00 }])
  end

  it 'Testa Cenario 4' do
    operacoes = [
      Operacao.new('buy', 10.00, 10000),
      Operacao.new('buy', 25.00, 5000),
      Operacao.new('sell', 15.00, 10000)
    ]
    
    resultado = imposto_calculator.calcular_imposto(operacoes)

    expect(resultado).to eq([{ tax: 0.00 }, { tax: 0.00 }, { tax: 0.00 }])
  end


  it 'Testa Cenario 5' do
    operacoes = [
      Operacao.new('buy', 10.00, 10000),
      Operacao.new('buy', 25.00, 5000),
      Operacao.new('sell', 15.00, 10000),
      Operacao.new('sell', 25.00, 5000)
    ]
    
    resultado = imposto_calculator.calcular_imposto(operacoes)

    expect(resultado).to eq([{ tax: 0.00 }, { tax: 0.00 }, { tax: 0.00 }, { tax: 10000.00 }])
  end

  it 'Testa Cenario 6' do
    operacoes = [
      Operacao.new('buy', 10.00, 10000),
      Operacao.new('sell', 2.00, 5000),
      Operacao.new('sell', 20.00, 2000),
      Operacao.new('sell', 20.00, 2000),
      Operacao.new('sell', 25.00, 1000)
    ]
    
    resultado = imposto_calculator.calcular_imposto(operacoes)

    expect(resultado).to eq([
      { tax: 0.00 }, 
      { tax: 0.00 }, 
      { tax: 0.00 }, 
      { tax: 0.00 }, 
      { tax: 3000.00 }
    ])
  end

  it 'Testa Cenario 7' do
    operacoes = [
      Operacao.new('buy', 10.00, 10000),
      Operacao.new('sell', 2.00, 5000),
      Operacao.new('sell', 20.00, 2000),
      Operacao.new('sell', 20.00, 2000),
      Operacao.new('sell', 25.00, 1000),
      Operacao.new('buy', 20.00, 10000),
      Operacao.new('sell', 15.00, 5000),
      Operacao.new('sell', 30.00, 4350),
      Operacao.new('sell', 30.00, 650)
    ]
    
    resultado = imposto_calculator.calcular_imposto(operacoes)

    expect(resultado).to eq([
      { tax: 0.00 }, 
      { tax: 0.00 }, 
      { tax: 0.00 }, 
      { tax: 0.00 }, 
      { tax: 3000.00 },
      { tax: 0.00 }, 
      { tax: 0.00 }, 
      { tax: 3700.00 }, 
      { tax: 0.00 }
    ])
  end

  it 'Testa Cenario 8' do
    operacoes = [
      Operacao.new('buy', 10.00, 10000),
      Operacao.new('sell', 50.00, 10000),
      Operacao.new('buy', 20.00, 10000),
      Operacao.new('sell', 50.00, 10000)
    ]
    
    resultado = imposto_calculator.calcular_imposto(operacoes)

    expect(resultado).to eq([
      { tax: 0.00 }, 
      { tax: 80000.00 }, 
      { tax: 0.00 }, 
      { tax: 60000.00 }
    ])
  end
end
