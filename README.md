# Calculadora de IMC (Índice de Massa Corporal) 📱

Este é um aplicativo para iOS desenvolvido em **Swift** utilizando **ViewCode**, que permite calcular o IMC (Índice de Massa Corporal) com base na altura e peso fornecidos pelo usuário.

## ⚙️ Funcionalidades

- Ajuste de **altura** e **peso** usando sliders interativos.
- Cálculo instantâneo do **IMC** após o toque no botão "Calcular IMC".
- Exibição de uma recomendação com base no IMC calculado.
- Alteração de cor da interface conforme a categoria do IMC.
- Botão "Recalcular" para ajustar os valores e refazer o cálculo.

## 🛠️ Tecnologias Utilizadas

- **Swift** (Swift 5+)
- **UIKit** (ViewCode)
- **Auto Layout** programaticamente
- **MVC (Model-View-Controller)**

## 🚀 Como Executar o Projeto

### Pré-requisitos:

- Xcode instalado (versão 13+ recomendada)
- Simulador de iPhone ou dispositivo físico rodando iOS 15+

### Passos:

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/nome-do-repositorio.git
   ```
2. Abra o projeto no Xcode:

	```bash
	cd nome-do-repositorio
	open nome-do-projeto.xcodeproj
	```
3. Execute o projeto no simulador pressionando a tecla:

	```bash
	Cmd + R
	```

## 🏗️ Estrutura do Projeto

	```sql
		📂 CalculadoraIMC
	├── 📂 Model
	│   ├── BMI.swift
	│   ├── CalculatorBrain.swift
	│
	├── 📂 View
	│   ├── CalculateView.swift
	│   ├── ResultView.swift
	│
	├── 📂 Controller
	│   ├── CalculateViewController.swift
	│   ├── ResultViewController.swift
	│
	├── 📂 Assets
	│   ├── calculate_background.png
	│   ├── result_background.png
	│
	├── 📂 Supporting Files
	│   ├── Info.plist
	│   ├── README.md
	```

## 📄 Funcionalidades
- CalculateViewController: Captura os valores dos sliders, calcula o IMC e apresenta a tela de resultados.
- CalculatorBrain: Realiza o cálculo do IMC e retorna a cor e recomendação adequadas.
- ResultViewController: Exibe o resultado formatado para o usuário.

## 📚 Próximos Passos
 - Melhorar o design da interface.
 - Adicionar validação de entrada de dados.
 - Implementar suporte a múltiplos idiomas.
 - Criar testes unitários.
 
 ## 🤝 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para enviar um pull request ou abrir uma issue.

1. Faça um fork do projeto
	```bash
	git fork https://github.com/seu-usuario/nome-do-repositorio.git
	```
2. Crie uma branch com sua funcionalidade
	```bash
	git checkout -b minha-feature
	```
3. Commit sual alterações
	```
	git commit -m "Adiciona nova funcionalidade"
	```
4. Envie para a branch principal
	```
	git push origin minha-feature
	```
	
## 📄 Licença
Este projeto está sob a licença MIT.

## 👨‍💻 Autor
Desenvolvido por Arthur Norat.

Se este projeto foi útil para você, não esqueça de deixar uma ⭐ no repositório!
