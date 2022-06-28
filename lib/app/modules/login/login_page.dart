import 'package:app_desafio/app/core/ui/widgets/custom_text_form_field.dart';
import 'package:app_desafio/app/modules/login/controller/login_controller.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginController loginController;
  const LoginPage({Key? key, required this.loginController}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      bloc: widget.loginController,
      listener: (context, state) {
        if (state is LoginStateLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoginStateLoaded) {
          if (state.logged == true) {
            Modular.to.navigate('/home');
          } else {
            AsukaSnackbar.alert('Login Invalido!').show();
          }
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 140, 212, 231),
                Color.fromARGB(255, 33, 105, 156),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Animal Adoption',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Icon(
                      PhosphorIcons.pawPrint,
                      size: 100,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // height: 49,
                      child: SizedBox(
                        child: CustomTextFormField(
                          hint: 'Email',
                          controller: _emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Email É Obrigatório!'),
                            Validatorless.email('Email Inválido'),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 49,
                      child: ElevatedButton(
                          onPressed: () {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;

                            if (formValid) {
                              widget.loginController.signIn(_emailEC.text);
                            }
                          },
                          child: const Text('Login')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
