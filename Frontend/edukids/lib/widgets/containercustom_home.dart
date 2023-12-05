import 'package:edukids/theme/apptheme.dart';
import 'package:flutter/material.dart';

class ContainerCustom_Home extends StatefulWidget {
  final String title;
  final String imageAsset; // Nueva propiedad para la imagen
  final Color containerColor; // Nueva propiedad para el color del contenedor

  const ContainerCustom_Home({
    Key? key,
    required this.title,
    required this.imageAsset,
    required this.containerColor,
  }) : super(key: key);

  @override
  State<ContainerCustom_Home> createState() => _ContainerCustom_HomeState();
}

class _ContainerCustom_HomeState extends State<ContainerCustom_Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
        color: widget.containerColor, // Usa el color proporcionado
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Transform.translate(
                offset: Offset(210, 76),
                child: Transform.scale(
                  scale: 0.8,
                  child: Image.asset(widget.imageAsset), // Usa la imagen proporcionada
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.only(right: 80, bottom: 1),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                wordSpacing: 2,
                color: AppTheme.secondaryColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 20),
            width: MediaQuery.of(context).size.width,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "¡Busca aquí, amigo!",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
