import 'dart:js';

import 'package:chat/helpers/mostrarAlerta.dart';
import 'package:chat/services/auth_services.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_label.dart';
import 'package:chat/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(60, 60, 60, 1),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(), //efecto de rebote
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context)
                .size
                .height, //para que abarque todo el espacio
            child: Column(
              children: [
                CustomLogo(texto: 'Iniciar sesión'),
                _Form(),
                CustomLabels(
                  ruta: 'register',
                  texto: 'Crear Cuenta',
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
              icono: Icons.mail_outline,
              placeHolder: 'Email',
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl),
          CustomInput(
            icono: Icons.lock,
            placeHolder: 'Password',
            keyboardType: TextInputType.text,
            textController: passCtrl,
            isPassword: true,
          ),
          TextField(),
          CustomButton(
            texto: 'Ingresar',
            onPressed: authService.autenticando
                ? () => {}
                : () async {
                    //Navigator.pushReplacementNamed(context, 'usuarios');
                    FocusScope.of(context).unfocus();
                    final loginRes =
                        await authService.login(emailCtrl.text, passCtrl.text);
                    if (loginRes) {
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      //Mostrar alerta
                      mostrarAlerta(context, 'Error en el login',
                          'Credenciales incorrectas');
                    }
                  },
          )
        ],
      ),
    );
  }
}
