require 'json'
require_relative 'operacao'
require_relative 'imposto_calculator'

class ImpostoProcessor
  def self.processar_linhas
    ARGF.each_line(chomp: true) do |linha|
      next if linha.strip.empty?

      begin
        operacoes = JSON.parse(linha.strip)
        imposto_calculator = ImpostoCalculator.new
        operacoes = operacoes.map { |op| Operacao.new(op["operation"], op["unit-cost"].to_f, op["quantity"].to_i) }
        resultado = imposto_calculator.calcular_imposto(operacoes)
        puts JSON.generate(resultado)
      rescue JSON::ParserError => e
        warn "Erro ao processar JSON na linha: #{linha}"
        warn e.message
      end
    end
  end
end
