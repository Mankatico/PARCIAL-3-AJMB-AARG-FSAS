import 'package:flutter/material.dart';

class ContainerCustom extends StatelessWidget {
  final Color color;
  const ContainerCustom({
    super.key, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.6,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}