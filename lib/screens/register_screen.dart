import 'package:as_sistemas_moveis/components/custom_imput.dart';
import 'package:as_sistemas_moveis/components/custom_input_passowrd.dart';
import 'package:as_sistemas_moveis/components/custom_loading.dart';
import 'package:as_sistemas_moveis/components/error_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final AuthService authService;

  const RegisterScreen({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.10,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomInput(
                controller: authService.emailControllerRegister,
                textInputType: TextInputType.emailAddress,
                label: 'Email',
                hintText: 'Email',
              ),
              CustomInputPassword(
                controller: authService.passwordControllerRegister,
                textInputType: TextInputType.visiblePassword,
                label: 'Password',
                hintText: 'Password',
              ),
              ErrorAuth(
                listenable: authService.isErrorGeneric,
                messageError: "Um problema ocorreu",
              ),
              CustomLoading(
                listenable: authService.isLoading,
                textButton: "Cadastre-se",
                action: () {
                  authService.register(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
