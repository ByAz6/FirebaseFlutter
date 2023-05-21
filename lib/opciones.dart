import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/Cliente.dart';

import 'Vehiculo.dart';
import 'Vehiculomd.dart';
import 'main.dart';



class opciones extends StatelessWidget {
  final categories = [    {'title': 'MD_CLientes', 'image': 'https://images.pexels.com/photos/5077404/pexels-photo-5077404.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},    {'title': 'MD_Vehiculo', 'image': 'https://images.pexels.com/photos/97077/pexels-photo-97077.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},    {'title': 'MD_ClienteVehiculo', 'image': 'https://images.pexels.com/photos/1521580/pexels-photo-1521580.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opciones',
      home: MediaQuery(
        data: MediaQuery.of(context),
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          appBar: AppBar(
            title: Text('Firebase'),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categorías',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Container(
                  height: categories.length * 90.0,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        title: categories[index]['title']!,
                        image: categories[index]['image']!,
                        onPressed: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;

  CategoryCard({required this.title, required this.image, required Null Function() onPressed});

  void _navigateToCategory(BuildContext context) {
    switch (title) {
      case 'MD_CLientes':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Cliente()),
        );
        break;
      case 'MD_Vehiculo':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VH()),
        );
        break;
      case 'MD_ClienteVehiculo':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const mdvh_()),
        );
        break;
      
      default:
        // Si se selecciona una categoría no válida, no hacemos nada.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToCategory(context);
      },
      child: Container(
        height:100.0,
        margin: EdgeInsets.only(bottom: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 247, 247),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}