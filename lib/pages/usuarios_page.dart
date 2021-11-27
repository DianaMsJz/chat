import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({Key? key}) : super(key: key);

  @override
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final usuario = [
    Usuario(
        email: 'cristian.lb@delicias.tecnm.mx',
        nombre: 'Cristian Luevanos',
        uid: '213231324',
        online: true),
    Usuario(
        email: 'mariel.bl@delicias.tecnm.mx',
        nombre: 'Mariel Baeza',
        uid: '546784391',
        online: false),
    Usuario(
        email: 'jose.cm@delicias.tecnm.mx',
        nombre: 'Manuel Chavarria',
        uid: '536984391',
        online: true),
    Usuario(
        email: 'vanessa.bs@delicias.tecnm.mx',
        nombre: 'Vanessa Burrola',
        uid: '946581391',
        online: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mis contactos'),
          elevation: 1,
          backgroundColor: Color.fromRGBO(166, 92, 254, 1),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          ),
          actions: [
            Container(
                padding: EdgeInsets.only(right: 25),
                child: Icon(Icons.circle_rounded,
                    color: Color.fromRGBO(120, 230, 10, 1)))
          ],
        ),
        backgroundColor: Color.fromRGBO(206, 241, 252, 1),
        body: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, i) => ListTile(
                  title: Text(usuario[i].nombre),
                  leading: CircleAvatar(
                    child: Text(usuario[i].nombre.substring(0, 2)),
                  ),
                  trailing: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                        color: usuario[i].online
                            ? Color.fromRGBO(120, 230, 10, 1)
                            : Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
            separatorBuilder: (_, i) => Divider(),
            itemCount: usuario.length));
  }
}
