require 'json'

class OutputView
  def self.exibir(resultado)
    puts JSON.generate(resultado)
  end
end
