require 'rspec'
require_relative '../src/models/operacao'

RSpec.describe Operacao do
  it 'cria uma instância de Operacao com os atributos corretos' do
    operacao = Operacao.new('buy', 100.0, 10)

    expect(operacao.tipo).to eq('buy')
    expect(operacao.preco_unitario).to eq(100.0)
    expect(operacao.quantidade).to eq(10)
  end
end
