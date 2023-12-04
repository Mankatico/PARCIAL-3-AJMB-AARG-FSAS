import 'package:edukids/theme/apptheme.dart';
import 'package:edukids/widgets/widgets.dart';
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
                "¡Hola chicos! Aprendamos de forma divertida con Mario y amigos. Exploraremos dictados, unidades y decenas juntos. \n¡Vamos a jugar y aprender!",
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
            MaterialCustom(),
          ],
        ),
      ),
    );
  }
}
