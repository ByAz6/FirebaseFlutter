import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore baseD = FirebaseFirestore.instance;
Future<List<Map<String, dynamic>>> getUsuarios() async {
  List<Map<String, dynamic>> usuarios = [];
  CollectionReference collectionReferenceUsuarios = baseD.collection('usuarios');
  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  queryUsuarios.docs.forEach((documento) {
    String documentId = documento.id;
    Map<String, dynamic>? data = documento.data() as Map<String, dynamic>?;
    data!['id'] = documentId; // Agregar el ID del documento al mapa de datos
    usuarios.add(data);
  });

  return usuarios;
}



Future<List<Map<String, dynamic>>> getclientes() async {
  List<Map<String, dynamic>> cliente = [];
  CollectionReference collectionReferenceUsuarios = baseD.collection('MD_CLientes');
  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  queryUsuarios.docs.forEach((documento) {
    String documentId = documento.id;
    Map<String, dynamic>? data = documento.data() as Map<String, dynamic>?;
    data!['id'] = documentId; // Agregar el ID del documento al mapa de datos
    cliente.add(data);
  });

  return cliente;
}


Future<List<Map<String, dynamic>>> getvh() async {
  List<Map<String, dynamic>> vh = [];
  CollectionReference collectionReferenceUsuarios = baseD.collection('MD_Vehiculo');
  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  queryUsuarios.docs.forEach((documento) {
    String documentId = documento.id;
    Map<String, dynamic>? data = documento.data() as Map<String, dynamic>?;
    data!['id'] = documentId; // Agregar el ID del documento al mapa de datos
    vh.add(data);
  });

  return vh;
}



Future<List<Map<String, dynamic>>> getmdvh() async {
  List<Map<String, dynamic>> mdvh = [];
  CollectionReference collectionReferenceUsuarios = baseD.collection('MD_ClienteVehiculo');
  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  queryUsuarios.docs.forEach((documento) {
    String documentId = documento.id;
    Map<String, dynamic>? data = documento.data() as Map<String, dynamic>?;
    data!['id'] = documentId; // Agregar el ID del documento al mapa de datos
    mdvh.add(data);
  });

  return mdvh;
}

/*
FirebaseFirestore baseD = FirebaseFirestore.instance;
Future<List> getUsuarios() async {
  List usuarios = [];
  CollectionReference collectionReferenceUsuarios =
      baseD.collection('usuarios');
  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();
  final snapshot= await FirebaseFirestore.instance.collection('usuarios').doc('UID').get();
  queryUsuarios.docs.forEach((documento) {
    usuarios.add(documento.data());
    usuarios.add(queryUsuarios.docs);
  });

  return usuarios;
}*/
//guardar usuario
Future<void> agregarUsuario(String usuario) async {
  await baseD.collection('usuarios').add({"nombre": usuario});
}

Future<void> actualizarUsuario(String doc, String nuevoNombre) async {
  await FirebaseFirestore.instance
      .collection('usuarios')
      .doc(doc)
      .update({"nombre": nuevoNombre});
}

Future<void> eliminar(String doc, table) async {
  await FirebaseFirestore.instance
      .collection(table.toString())
      .doc(doc)
      .delete();
}

/**
 * usuario:[{
 * nombre:"Tomas"
 * },
 * {
 * nombre:"Luis"
 * },
 * {
 * nombre:"Maria"
 * }
 * ]
 * 
 */


Future<void> actualizarcliente(String doc, String strCliente,String strNombreCliente,String strApellidoCliente,String strDireccion,String strCiudad) async {
  await FirebaseFirestore.instance
      .collection('MD_CLientes')
      .doc(doc)
      .update({"ID_Cliente": strCliente, "sNombreCliente": strNombreCliente,"sApellidosCliente": strApellidoCliente, "sDireccionCliente": strDireccion, "sCiudadCliente": strCiudad});
}







/*AGREGAR CLIENTE*/
Future<void> agregarCliente(String strCliente,String strNombreCliente,String strApellidoCliente,String strDireccion,String strCiudad) async {

 await baseD.collection('MD_CLientes').add({"ID_Cliente": strCliente, "sNombreCliente": strNombreCliente,"sApellidosCliente": strApellidoCliente, "sDireccionCliente": strDireccion, "sCiudadCliente": strCiudad},);


}

Future<void> actualizarvehiculo(String doc, String strVehiculo,String strMarca,String strModelo) async {

 await FirebaseFirestore.instance

   .collection('MD_Vehiculo')

   .doc(doc)

   .update({"ID_Vehiculo": strVehiculo, "sMarca": strMarca,"sModelo": strModelo});

}


/*AGREGAR VEHICULOS*/

Future<void> agregarVehiculo(String strVehiculo,String strMarca,String strModelo) async {

 await baseD.collection('MD_Vehiculo').add({"ID_Vehiculo": strVehiculo,"sMarca": strMarca,"sModelo": strModelo});

}


/*AGREGAR CLIENTE VEHICULO*/

Future<void> agregarClienteVehiculo(String strCliente,String strVehiculo,String strMatricula,String douKilometros) async {

 await baseD.collection('MD_ClienteVehiculo').add({"ID_Cliente": strCliente,"ID_Vehiculo": strVehiculo,"sMatricula": strMatricula,"iKilometros": douKilometros});

}

Future<void> actualizarclientevehiculo(String doc,String strCliente,String strVehiculo,String strMatricula,String douKilometros) async {

 await FirebaseFirestore.instance

   .collection('MD_ClienteVehiculo')

   .doc(doc)

   .update({"ID_Cliente": strCliente,"ID_Vehiculo": strVehiculo, "iKilometro": douKilometros,"sMatricula": strMatricula});

}