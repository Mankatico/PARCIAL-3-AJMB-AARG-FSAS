import 'package:edukids/theme/apptheme.dart';
import 'package:edukids/widgets/widgets.dart';
import 'package:flutter/material.dart';

class stackCustom extends StatelessWidget {
  const stackCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ContainerCustom(color: Colors.white),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.6,
          decoration: const BoxDecoration(
            color: AppTheme.primaryColorMario,
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(70)),
          ),
          child: Center(
            child: Transform.scale(
              scale:
                  0.7, // Puedes ajustar este valor para cambiar el tamaño
              child: Image.asset(
                'assets/images/header-mario.png',
                // Otras propiedades de la imagen, si es necesario
              ),
            ),
          ),
        )
      ],
    );
  }
}
