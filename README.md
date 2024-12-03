# Projeto de Avaliação Semestral - Sistemas Móveis

Este repositório contém o projeto de avaliação semestral da disciplina de **Sistemas Móveis**, focado no desenvolvimento de um aplicativo multiplataforma com funcionalidades básicas de autenticação e integração com uma API.

## 📋 Funcionalidades

- Tela de Login com autenticação.
- Página inicial que realiza requisições para uma API.
- Suporte para Android, iOS, web e desktop.

## 🚀 Tecnologias Utilizadas

- **Linguagem principal:** Dart
- **Frameworks/Plataformas:** Flutter, APIs nativas
- **Firebase**: Auth

## 🛠️ Configuração do Ambiente

1. Certifique-se de ter o [Flutter](https://flutter.dev) instalado.

3. Certifique-se de ter o [Android Studio](https://developer.android.com/studio/install?hl=pt-br) instalado.
   
5. Certifique-se de ter o [Dart](https://dart.dev/) instalado.
   
6. Clone este repositório:
   ```bash
   git clone https://github.com/Viniciusrcarlos/as_sistemas_moveis.git

7. Configure o seu [Firebase](https://firebase.google.com/?hl=pt-br)

## 📄 Configuração do Firebase

- Inicie sua conta no console do [Firebase](https://console.firebase.google.com/)

1. Execute no terminal o comando abaixo para realizar o login
   ```bash
   firebase login

2. Instalar o flutterFire vai nos ajudar a configurar o firebase no projeto
- 🚨 É necessário ter o Dart instalado na Variável de Ambiente do seu computador 🚨
   ```bash
   dart pub global activate flutterfire_cli

3. Dentro do diretório do projeto, execute
   ```bash
   flutterfire configure
- Durante a configuração, vai ser solicitado o packageName da aplicação, no android conseguimos pegar dentro da pasta app de android:
  ![image](https://github.com/user-attachments/assets/6f062392-fa31-47e1-a035-a612de2a3971)
  ![Copiar a String de que está após namespace = ](https://github.com/user-attachments/assets/8ee7bcfe-8100-491d-9168-9a03e70d0385)

4. Após isso, execute o comando ainda dentro do projeto
   ```bash
   flutter pub add firebase_core

5. No arquivo **`lib/main.dart`**, importe o plug-in principal do Firebase e o arquivo de configuração gerado antes.
   ```bash
   import 'package:firebase_core/firebase_core.dart';
   import 'firebase_options.dart';

6. Depois desses passos de configuração, adicione a dependencia de Auth
   ```bash
   flutter pub add firebase_auth
