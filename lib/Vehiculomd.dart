import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/pantallas/add_usuario.dart';
import 'package:flutter_firebaseapp/pantallas/firebaseapp.dart';
import 'package:flutter_firebaseapp/pantallas/update_usuer.dart';

import 'Mdvehiculo/addmdvehiculo.dart';
import 'Mdvehiculo/basemdvehiculo.dart';
import 'Mdvehiculo/updatemdvehiculo.dart';
import 'Vehiculo/addvehiculo.dart';
import 'Vehiculo/basevehiculo.dart';
import 'Vehiculo/updatevehiculo.dart';
import 'firebase_options.dart';
import 'opciones.dart';


class mdvh_ extends StatelessWidget {
  const mdvh_({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirebaseCRUD',
      initialRoute: '/',
      routes: {
        //  '/': (context) =>  opciones(),
       
        '/': (context) =>  const basemdvehiculo(),
        '/add': (context) => const addmdvehiculo(),
        '/edit': (context)=> const updatemdvehiculo( id: null, nombre: null,),
        },
    );


  
  }



  
}
