import 'package:edukids/theme/apptheme.dart';
import 'package:flutter/material.dart';

class BottomNavigation_Home extends StatelessWidget {
  final int currentIndex; // Nuevo parámetro
  final Function(int) onItemSelected; // Nuevo parámetro

  const BottomNavigation_Home({
    Key? key,
    required this.currentIndex, // Agregar el parámetro al constructor
    required this.onItemSelected, // Agregar el parámetro al constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      iconSize: 32,
      selectedItemColor: AppTheme.primaryColor,
      selectedFontSize: 18,
      unselectedItemColor: Colors.black.withOpacity(0.5),
      currentIndex: currentIndex,
      onTap: (index) {
        // Llama a la función onItemSelected y pasa el índice seleccionado
        onItemSelected(index);

        // Agrega una condición para navegar a la pantalla de HomeScreen
        if (index == 0) {
          // Si ya estamos en la pantalla de inicio, simplemente volvemos a la pantalla anterior
          Navigator.of(context).pop();
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment), label: 'Informacion'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Apoyanos'),
      ],
    );
  }
}
