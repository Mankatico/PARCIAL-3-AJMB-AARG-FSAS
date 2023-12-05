import 'package:edukids/theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MaterialCustom extends StatefulWidget {
  const MaterialCustom({
    Key? key,
  }) : super(key: key);

  @override
  _MaterialCustomState createState() => _MaterialCustomState();
}

class _MaterialCustomState extends State<MaterialCustom> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  void createUser(String name) async {
    final apiUrl = Uri.parse('http://192.168.204.102:3000/addUser');

    try {
      final response = await http.post(
        apiUrl,
        body: {'name': name},
      );

      if (response.statusCode == 200) {
        print('Usuario creado exitosamente');
      } else {
        print('Error al crear el usuario. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al conectar con la API: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.primaryColorMario,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text("¡Hola! Soy Mario, ¿cómo te llamas?"),
                content: CupertinoTextField(
                  controller: _nameController, // Asigna el controlador aquí
                  placeholder: "Tu nombre",
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text("Mamma mia, cancelar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("¡Vamos!"),
                    onPressed: () {
                      Navigator.pop(context);
                      // Llama a la función createUser con el nombre ingresado
                      createUser(_nameController.text);
                      Navigator.pushNamed(context, 'Home');
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
          child: Text(
            '¡It’s-a me, Mario! \n¡Vamos a aprender!',
            style: TextStyle(
              color: AppTheme.secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
