import 'package:edukids/theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alingCustom extends StatelessWidget {
  const alingCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.666,
        padding: EdgeInsets.only(top: 40, bottom: 30),
        decoration: BoxDecoration(
            color: AppTheme.secondaryColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
        child: Column(
          children: [
            Text(
              'EduKids',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Con este juego enseñaremos de una manera didactica como podemos divertinos aprendiendo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Material(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Text("Ingrese su nombre de usuario \npor favor"),
                        content: CupertinoTextField(
                          placeholder: "Nombre",
                          
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("Cancelar"),
                            onPressed: () {
                              Navigator.pop(
                                  context); 
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text("Aceptar"),
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
                    'Comencemos',
                    style: TextStyle(
                      color: AppTheme.secondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
