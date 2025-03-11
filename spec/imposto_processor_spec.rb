require 'rspec'
require 'json'
require_relative '../src/models/operacao'
require_relative '../src/models/imposto_calculator'
require_relative '../src/views/output'
require_relative '../src/services/imposto_processor'

describe ImpostoProcessor do
  before do
    allow(OutputView).to receive(:exibir)
  end

  context "when processing valid JSON input" do
    let(:valid_json) { '[{"operation": "buy", "unit-cost": 10.0, "quantity": 5}]' }

    it "parses JSON and processes operations" do
      allow(ARGF).to receive(:each_line).and_yield(valid_json)
      
      expect(Operacao).to receive(:new).with("buy", 10.0, 5).and_return(instance_double("Operacao"))
      expect_any_instance_of(ImpostoCalculator).to receive(:calcular_imposto).and_return([])
      expect(OutputView).to receive(:exibir).with([])
      
      ImpostoProcessor.processar_linhas
    end
  end

  context "when processing empty lines" do
    it "ignores empty lines" do
      allow(ARGF).to receive(:each_line).and_yield("\n").and_yield("   ")
      
      expect(Operacao).not_to receive(:new)
      expect(OutputView).not_to receive(:exibir)
      
      ImpostoProcessor.processar_linhas
    end
  end

  context "when JSON is invalid" do
    let(:invalid_json) { 'invalid json' }

    it "handles JSON parsing errors gracefully" do
      allow(ARGF).to receive(:each_line).and_yield(invalid_json)
      
      expect { ImpostoProcessor.processar_linhas }.to output(/Erro ao processar operacao/).to_stderr
    end
  end
end