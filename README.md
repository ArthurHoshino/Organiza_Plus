# 🧹 Organiza Plus

Um simples aplicativo Flutter para acompanhar tarefas diárias.

## 💡 Funcionalidades
* Filtro de tarefas por categoria (Todas, A Fazer e Concluídas)
* Edição da descrição das tarefas
* Estatísticas das tarefas realizadas no dia
* Volta as tarefas para o status "A Fazer" ao trocar o dia

## ⚙️ Executando o projeto
Após clonar o projeto, acesse a pasta e instale as dependências:
```shell
cd Organiza_Plus

flutter pub get
```

Antes de rodar o projeto, caso utilize o seu dispositivo, primeiro verifique que ele foi reconhecido:
```shell
flutter devices
```

O seu dispositvo deve aparecer na listagem, mais ou menos da seguinte maneira:
```txt
Found 4 connected devices:
  SM A546E (mobile) • ID_CELULAR • android-arm64  • Android 16 (API 36)
  Windows (desktop) • windows    • windows-x64    • Microsoft Windows [versÆo 10.0.26100.6725]
  Chrome (web)      • chrome     • web-javascript • Google Chrome 142.0.7444.134
  Edge (web)        • edge       • web-javascript • Microsoft Edge 142.0.3595.94
```

Caso apareça somente um dispositvo (o seu celular conectado), basta rodar o comando `flutter run` que ele será selecionado automaticamente. Do contrário, será necessário especificar qual o dispositivo desejado:
```shell
flutter run -d ID_CELULAR
``` 

Se estiver utilizando o Android Studio ou o VSCode que reconheça o dispositivo, basta garantir que ele está selecionado e em seguida utilizar os próprios recursos da IDE para executar o projeto.

## 🎬 Demonstração


## 🧑‍💻 Integrantes
* [Arthur Osaka Hoshino](http://github.com/ArthurHoshino)
* [Bruno Koji Nakao](http://github.com/brunokojota)
* [Fernando Manso Isaac](http://github.com/Fernando-MI)
* [João Henrique Guimarães da Silva](http://github.com/joao591)