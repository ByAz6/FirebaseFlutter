import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class addcliente extends StatefulWidget {
  const addcliente({super.key});

  @override
  State<addcliente> createState() => _addclienteState();
}

class _addclienteState extends State<addcliente> {
  TextEditingController ID_Cliente = TextEditingController(text: "");
  TextEditingController sNombreCliente = TextEditingController(text: "");
  TextEditingController sApellidosCliente = TextEditingController(text: "");
  TextEditingController sDireccionCliente = TextEditingController(text: "");
  TextEditingController sCiudadCliente = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("agregar cliente"),
      ),
      body: Padding(
        padding:const EdgeInsets.all(25.0),
        child: Column(
          children: [
           const Center(
              child:  Text(
                'pagina agregar cliente',
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextField(
              controller: ID_Cliente,
              decoration: const InputDecoration(hintText: 'Ingrese el ID_Cliente'),
            ),
            TextField(
              controller: sNombreCliente,
              decoration: const InputDecoration(hintText: 'Ingrese el sNombreCliente'),
            ),
            TextField(
              controller: sApellidosCliente,
              decoration: const InputDecoration(hintText: 'Ingrese el sApellidosCliente'),
            ),
            TextField(
              controller: sDireccionCliente,
              decoration: const InputDecoration(hintText: 'Ingrese el sDireccionCliente'),
            ),
            TextField(
              controller: sCiudadCliente,
              decoration: const InputDecoration(hintText: 'Ingrese el sCiudadCliente'),
            ),
            ElevatedButton(
                onPressed: () async {
                  //print(usuariosController.text);
                  await agregarCliente(ID_Cliente.text,sNombreCliente.text, sApellidosCliente.text, sDireccionCliente.text,sCiudadCliente.text,).then((_) {
                    Navigator.pop(context);
                  });
                  //   Navigator.pop(context);
                },
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
