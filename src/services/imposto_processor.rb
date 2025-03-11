require 'json'
require_relative '../models/operacao'
require_relative '../models/imposto_calculator'
require_relative '../views/output'

class ImpostoProcessor
  def self.processar_linhas
    ARGF.each_line(chomp: true) do |linha|
      next if linha.strip.empty?

      begin
        operacoes = JSON.parse(linha.strip).map do |op|
          Operacao.new(op["operation"], op["unit-cost"].to_f, op["quantity"].to_i)
        end

        imposto_calculator = ImpostoCalculator.new
        resultado = imposto_calculator.calcular_imposto(operacoes)

        OutputView.exibir(resultado)
      rescue JSON::ParserError => e
        warn "Erro ao processar operacao: #{linha}"
        warn e.message
      end
    end
  end
end
