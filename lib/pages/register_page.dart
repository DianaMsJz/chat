import 'package:chat/helpers/mostrarAlerta.dart';
import 'package:chat/services/auth_services.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_label.dart';
import 'package:chat/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(60, 60, 60, 1),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context)
                  .size
                  .height, //para que abarque todo el espacio
              child: Column(
                children: [
                  CustomLogo(texto: 'Registrarse'),
                  _Form(),
                  CustomLabels(
                    ruta: 'login',
                    texto: 'Regresar',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Column(
      children: [
        CustomInput(
            icono: Icons.person,
            placeHolder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nombreCtrl),
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
            texto: 'Registrar',
            onPressed: authService.autenticando
                ? () => {}
                : () async {
                    final registro = await authService.register(
                        nombreCtrl.text, emailCtrl.text, passCtrl.text);
                    if (registro == true) {
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      mostrarAlerta(context, 'Registro Incorrecto', registro);
                    }
                  })
      ],
    );
  }
}
