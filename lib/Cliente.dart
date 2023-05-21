import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/pantallas/add_usuario.dart';
import 'package:flutter_firebaseapp/pantallas/firebaseapp.dart';
import 'package:flutter_firebaseapp/pantallas/update_usuer.dart';
import 'Clientes/addcliente.dart';
import 'Clientes/basecliente.dart';
import 'Clientes/updatecliente.dart';
import 'firebase_options.dart';
import 'opciones.dart';


class Cliente extends StatelessWidget {
  const Cliente({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirebaseCRUD',
      initialRoute: '/',
      routes: {
        //  '/': (context) =>  opciones(),
       
        '/': (context) =>  basecliente(),
        '/add': (context) => const addcliente(),
        '/edit': (context)=> const updatecliente( id: null, nombre: null,),
        },
    );


  
  }



  
}
