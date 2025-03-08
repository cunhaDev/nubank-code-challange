require 'json'
require 'stringio'
require_relative '../src/imposto_processor'
require_relative '../src/operacao'
require_relative '../src/imposto_calculator'

describe ImpostoProcessor do
  before do
    @original_stdin = $stdin
    @original_stdout = $stdout
    @original_stderr = $stderr
  end

  after do
    $stdin = @original_stdin
    $stdout = @original_stdout
    $stderr = @original_stderr
  end

  it 'processa corretamente uma linha de operacoes de compra e venda' do
    input = '[{"operation": "buy", "unit-cost": 10.0, "quantity": 100}, {"operation": "sell", "unit-cost": 15.0, "quantity": 50}]'
    $stdin = StringIO.new(input)
    $stdout = StringIO.new

    ImpostoProcessor.processar_linhas

    output = JSON.parse($stdout.string.strip)
    expect(output).to eq([{ "tax" => 0.00 }, { "tax" => 0.00 }])
  end
end