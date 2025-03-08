# Nubank Code Challange
Aplicação CLI desenvolvida como desafio técnico para uma vaga de Engenheiro de Software na Nubank.

## Tecnologias Adotada
Após mais de 4 anos estudando e trabalhando com Java, o que me motivava a aprender coisas novas sempre foi o Trabalho, foi assim que eu aprendi a lidar com Javacript e Python.
Cerca de um mês atrás resolvi aprender uma nova linguagem de programação e optei pelo Ruby onde vi neste desafio uma grande oportunidade para exercitar de fato meus conhecimentos nesta nova linguagem.
Para construção dos testes unitarios foi usado o framework RSpec por ser bastante comum no Ruby, neste quisito confesso que não tenho tantos conhecimentos como no uso de Junit ou Mockito para o Java, mas consegui desenvolver alguns cenarios através de pesquisas.

## Arquitetura e organização do codigo.
Por ser uma aplicação relativamente simples e sem muita regra ou complexidade envolvida, optei por usar o bom e velho  padrão de design [MVC Model-View-Controller](https://www.devmedia.com.br/padrao-mvc-java-magazine/21995), onde as camadas da aplicação estão organizadas da seguinte maneira:

 ```bash
├── inputs/                   # Contém todos inputs relacionados aos cenarios solicitados como arquivos txt
├── spec/                     # Diretório contendo os testes do projeto
├── src/                      # Diretório contendo a lógica de negócio
│   ├── operacao.rb           # Classe para representar operações
│   ├── imposto_calculator.rb # Classe para calcular impostos
│   ├── imposto_processor.rb  # Classe para processar as operações
│   └── main.rb               # Ponto de entrada da aplicação
├── Gemfile                   # Dependências do Ruby
└── README.md                 # Documentação
```

## Configuração de Ambiente

### 1. Para Windows

- **Instalar Ruby**: Baixe e instale o Ruby via [RubyInstaller](https://rubyinstaller.org/).
- **Instalar o Bundler**: Após instalar o Ruby, execute o seguinte comando para instalar o Bundler:

  ```bash
  gem install bundler
  ```

- **Instalar Dependências**: No diretório do projeto, execute:

  ```bash
  bundle install
  ```

- **Rodar os Testes**: Agora você pode rodar os testes com `bundle exec rspec` ou outro comando de teste mencionado.

### 2. Para Linux

- **Instalar Ruby**: Para instalar o Ruby no Ubuntu/Debian, execute:

  ```bash
  sudo apt update
  sudo apt install ruby-full
  ```

- **Instalar o Bundler**: Após instalar o Ruby, instale o Bundler com:

  ```bash
  gem install bundler
  ```

- **Instalar Dependências**: No diretório do projeto, execute:

  ```bash
  bundle install
  ```

- **Rodar os Testes**: Agora você pode rodar os testes com `bundle exec rspec`.

### 3. Para macOS

- **Instalar Ruby**: Se necessário, use o Homebrew para instalar a versão mais recente do Ruby:

  ```bash
  brew install ruby
  ```

- **Instalar o Bundler**: Instale o Bundler com o seguinte comando:

  ```bash
  gem install bundler
  ```

- **Instalar Dependências**: No diretório do projeto, execute:

  ```bash
  bundle install
  ```

- **Rodar os Testes**: Agora você pode rodar os testes com `bundle exec rspec`.

## Executando a aplicação
Para rodar a aplicação, use o seguinte comando, passando o arquivo de entrada contendo as transações:

```bash
ruby src/main.rb < inputs/caso_desejado.txt
```

Substitua `caso_desejado.txt` pelo arquivo que contém os dados de entrada localizado na pasta inputs.

## Como Rodar os Testes

Este projeto utiliza o framework de testes RSpec para testar as funcionalidades da aplicação.

### 1. Rodar todos os testes

Para rodar todos os testes do projeto, execute o comando:

```bash
bundle exec rspec
```

### 2. Rodar um teste específico pelo nome

Para rodar um teste específico pelo nome, use a flag `--example` e passe o nome do teste entre aspas. Exemplo:

```bash
bundle exec rspec --example "cenario 2"
```

### 3. Rodar os testes de uma única classe

Para rodar os testes de uma classe específica, passe o caminho do arquivo de teste como argumento. Exemplo:

```bash
bundle exec rspec spec/imposto_calculator_spec.rb
```

## Material de Apoio
[Como instalar e usar Ruby em distribuições Linux](https://pt.linux-terminal.com/?p=907)
[Testes unitarios usando RSpec](https://www.dio.me/articles/uma-introducao-ao-rspec-testando-em-ruby-com-elegancia)
[MVC Model-View-Controller](https://www.devmedia.com.br/padrao-mvc-java-magazine/21995)
[Como instalar Ruby no MacOs](https://pedrohjmartins.medium.com/como-instalar-ruby-no-macos-80537b81821b)
[como usar Ruby no Windows](https://www.ruby-lang.org/pt/documentation/installation/)