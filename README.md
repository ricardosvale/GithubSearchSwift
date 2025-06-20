# GithubSearchSwift

O **GithubSearchSwift** é um aplicativo iOS desenvolvido em Swift e SwiftUI que permite aos usuários pesquisar repositórios no GitHub e visualizar detalhes como imagem e nome do usuário, nome e linguagem de programação do repositório.

## 📌 Funcionalidades

- 🔍 **Busca de repositórios** no GitHub por nome do usuário.  
- 📋 **Exibição de detalhes** do usuário como imagem e nome, detalhes do repositório incluindo nome e linguagem de programação.  
- ⚠️ **Alertas de erro** para informar quando a busca falha ou ocorre algum problema na requisição.  

## 📋 Requisitos

- 📱 iOS 14.0 ou superior  
- 🛠 Xcode 12.0 ou superior
- 📦 Swift Package Manager (SPM) para gerenciamento de dependências
 
 ## 📦 Dependências

O projeto utiliza **Alamofire** para realizar requisições HTTP. Ele já está configurado no **Swift Package Manager (SPM)**. Caso precise instalá-lo manualmente, siga os passos abaixo:  

1. No Xcode, vá até **File** → **Add Packages...**  
2. Adicione o seguinte repositório: https://github.com/Alamofire/Alamofire.git
3. Escolha a versão desejada e finalize a instalação.  

## 🚀 Instalação

1. Clone este repositório:  
```bash
  git clone https://github.com/ricardosvale/GithubSearchSwift.git
```
2. Abra o arquivo GithubSearch.xcodeproj no Xcode.
3. Selecione o destino desejado (simulador ou dispositivo) e execute o aplicativo.

## 💡 Uso
  
1.	Abra o aplicativo.
2.	Digite o nome do repositório que deseja buscar na barra de pesquisa.
3.	Os resultados correspondentes serão exibidos em uma lista.
4.	Se houver erro na busca, um alerta será exibido informando o problema.

## Projeto sera refatorado... 
