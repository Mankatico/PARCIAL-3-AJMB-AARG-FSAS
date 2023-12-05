import 'dart:convert';
import 'package:edukids/theme/apptheme.dart';
import 'package:edukids/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:edukids/models/models.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final url = Uri.parse("http://192.168.204.102:3000/users");
  late Future<List<User>> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ContainerCustom_Home(
            title:
                "¡Estos son nuestros usuarios en \nla aplicación, verifica tu podio!",
            imageAsset: 'assets/images/bowser-stack-closed.png',
            containerColor: AppTheme.primaryColorBowser,
          ),
          FutureBuilder<List<User>>(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final userList = snapshot.data ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final user = userList[index];
                      return UserListItem(user: user, position: index + 1);
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation_Home(
        currentIndex: 1,
        onItemSelected: (p0) {},
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    users = getUsers();
  }

  Future<List<User>> getUsers() async {
    final res = await http.get(url);
    final listUsers = List.from(jsonDecode(res.body));
    List<User> users = [];
    listUsers.forEach((element) {
      final User user = User.fromJson(element);
      users.add(user);
    });
    print(users);
    return users;
  }
}

class UserListItem extends StatelessWidget {
  final User user;
  final int position;

  UserListItem({
    Key? key,
    required this.user,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.amber[600],
          child: _buildAvatarContent(),
        ),
        title: Text(
          user.nombre,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Text(
          'Puntos: ${user.puntos}',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarContent() {
    // Mostrar posición solo si es 1, 2 o 3; de lo contrario, mostrar estrella
    if (position >= 1 && position <= 3) {
      return Text(
        '$position${_getOrdinalSuffix(position)}',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      );
    } else {
      // Mostrar estrella para posiciones mayores a 3
      return Icon(
        Icons.star,
        color: Colors.white,
        size: 24,
      );
    }
  }

  String _getOrdinalSuffix(int number) {
    if (number % 100 > 10 && number % 100 < 14) {
      return 'th';
    }
    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
