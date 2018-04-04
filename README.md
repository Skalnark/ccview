# CCView

Explicação breve sobre o que é o projeto pra nos guiar agora no começo (sujeito a mudança).

## Apresentador de casos clínicos
A aplicação deverá ser utilizada por professores e alunos dos cursos de ciências médicas para apresentar casos clínicos que possam ser utilizados para assistir os alunos no seu aprendizado.

## Features
#### Os casos
- Devem conter um enunciado, descrição breve, descrição detalhada, galeria de imagens (e estas possuirem descrições), a pergunta (escrita pelo professor), um conjunto de respostas e os textos auxiliares referentes as respostas erradas.
- Algum sistema de classificação de tipos **(tags?)** para auxiliar na busca, quando necessário.

Os casos são o nosso objeto principal aqui, é bem provável que essa estrutura mude durante o projeto.

#### Quanto aos professores
 - Deverão ser capazes de criar turmas e enviar os convites ou aceitar as solicitações dos alunos para entrar em uma.
 - Criar um novo caso clínico ou procurar um caso clínico na base de dados.
 - Criar módulos com casos diversos.
- Poderá criar um tipo de portifólio.
#### Quanto aos alunos
- Deverão ser capazes de buscar as turmas na base de dados.
- A visualização dos casos não necessariamente deve depender de estar em uma turma (embora alguns casos possam não estar disponíveis para alunos fora da turma).
- Ter um histórico dos casos resolvidos/favoritos (quem sabe até uma pontuação).


Quanto a estética do site, essa vai ter que esperar um pouco.


## Rodando o projeto

Parar rodar o servidor, além de ter que configurar o database.yaml e o secrets.yaml, vc vai precisar usar os seguintes comandos:

rails db:create
rails db:migrate

para criar e fazer a migração do banco de dados.

## Mandando o projeto pro servidor de deploy

O capistrano já está configurado!