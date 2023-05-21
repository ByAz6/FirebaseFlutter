import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/pantallas/add_usuario.dart';
import 'package:flutter_firebaseapp/pantallas/firebaseapp.dart';
import 'package:flutter_firebaseapp/pantallas/update_usuer.dart';

import 'Vehiculo/addvehiculo.dart';
import 'Vehiculo/basevehiculo.dart';
import 'Vehiculo/updatevehiculo.dart';
import 'firebase_options.dart';
import 'opciones.dart';


class VH extends StatelessWidget {
  const VH({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirebaseCRUD',
      initialRoute: '/',
      routes: {
        //  '/': (context) =>  opciones(),
       
        '/': (context) =>  const basevehiculo(),
        '/add': (context) => const addvehiculo(),
        '/edit': (context)=> const updatevehiculo( id: null, nombre: null,),
        },
    );


  
  }



  
}
