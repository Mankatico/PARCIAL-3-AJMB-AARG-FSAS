import 'package:edukids/theme/apptheme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
            decoration: BoxDecoration(
                color: AppTheme.primaryColorLuigi,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Transform.translate(
                      offset: Offset(
                          210, 76), // Ajusta estos valores para mover la imagen
                      child: Transform.scale(
                        scale:
                            0.8, // Ajusta este valor para cambiar el tamaño de la imagen
                        child: Image.asset(
                          'assets/images/luigi-stack-closed.png',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 80, bottom: 1),
                  child: Text(
                    "¡Hola! ¿Qué vamos a aprender hoy? \n¡Estoy listo para la acción educativa!",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        color: AppTheme.secondaryColor),
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
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                        )),
                  ),
                ),
              ],
            ),
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
                    return Column(
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
                    Text(
                      'Ver mas',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF67A4EF)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: imgList.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          (MediaQuery.of(context).size.height - 50 - 25) /
                              (4 * 240),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                              imgList[index].toUpperCase(),
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.amber[800],
                              ),
                            ),
                            Text('135 puntos',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 32,
        selectedItemColor: AppTheme.primaryColorLuigi,
        selectedFontSize: 18,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'Informacion'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Apoyanos'),
        ],
      ),
    );
  }
}
