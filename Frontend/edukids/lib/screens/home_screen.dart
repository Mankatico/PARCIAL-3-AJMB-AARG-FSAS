import 'dart:convert';
import 'package:edukids/models/models.dart';
import 'package:edukids/screens/screens.dart';
import 'package:edukids/theme/apptheme.dart';
import 'package:edukids/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url = Uri.parse("http://192.168.204.102:3000/users");

  List categoryNames = [
    'Dictado',
    'Numeracion Decimal',
    'Otros juegos',
    'Reportes',
    'Desarrolladores'
  ];

  List<Color> categoryColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),
    Color(0xFFCB84FB),
  ];

  List<Icon> categoryIcons = [
    Icon(
      Icons.category,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.numbers,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.games,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.error,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.person_3_outlined,
      color: Colors.white,
      size: 30,
    ),
  ];

  List imgList = ['peach', 'bowser', 'toad'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ContainerCustom_Home(
            title:
                "¡Hola! ¿Qué vamos a aprender hoy? \n¡Estoy listo para la acción educativa!",
            imageAsset: 'assets/images/luigi-stack-closed.png',
            containerColor: AppTheme.primaryColorLuigi,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: categoryNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.1),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryDetailScreen(
                              categoryName: categoryNames[index],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: categoryColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: categoryIcons[index],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            categoryNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '¡Jugadores estelares!',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UsersScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Ver más',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF67A4EF),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<User>>(
                  // Utiliza un FutureBuilder para cargar la lista de usuarios
                  future: getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final userList = snapshot.data ?? [];

                      // Ordena la lista de usuarios por puntaje de mayor a menor
                      userList.sort((a, b) => b.puntos.compareTo(a.puntos));

                      // Selecciona los primeros 3 usuarios
                      final topUsers = userList.take(3).toList();

                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: topUsers.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (MediaQuery.of(context).size.height - 50 - 25) / (4 * 240),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final user = topUsers[index];
                          return InkWell(
                            onTap: () {
                              // Acción al hacer clic en un usuario
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF5F3FF),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      "assets/images/${imgList[index]}-stack-closed.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    user.nombre.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.amber[800],
                                    ),
                                  ),
                                  Text(
                                    'Puntos: ${user.puntos}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation_Home(
        currentIndex: 0,
        onItemSelected: (p0) {},
      ),
    );
  }

  // La función que obtiene la lista de usuarios
  Future<List<User>> getUsers() async {
    final res = await http.get(url);
    final listUsers = List.from(jsonDecode(res.body));
    List<User> users = [];
    listUsers.forEach((element) {
      final User user = User.fromJson(element);
      users.add(user);
    });
    return users;
  }
}
