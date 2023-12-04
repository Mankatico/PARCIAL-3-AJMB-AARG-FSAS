import 'package:edukids/theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialCustom extends StatelessWidget {
  const MaterialCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text("¡Hola! Soy Mario, ¿cómo te llamas?"),
                content: CupertinoTextField(
                  placeholder: "Tu nombre",
                  
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text("Mamma mia, cancelar"),
                    onPressed: () {
                      Navigator.pop(
                          context); 
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("¡Vamos!"),
                    onPressed: () {
                      Navigator.pop(context); 
                      Navigator.pushNamed(
                          context, 'Home'); 
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
