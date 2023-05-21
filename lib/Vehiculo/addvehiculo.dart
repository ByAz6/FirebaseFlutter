import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class addvehiculo extends StatefulWidget {
  const addvehiculo({super.key});

  @override
  State<addvehiculo> createState() => _addvehiculoState();
}

class _addvehiculoState extends State<addvehiculo> {
  TextEditingController strVehiculo = TextEditingController(text: "");
  TextEditingController strMarca = TextEditingController(text: "");
  TextEditingController strModelo = TextEditingController(text: "");
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("agregar vehiculo"),
      ),
      body: Padding(
        padding:const EdgeInsets.all(25.0),
        child: Column(
          children: [
           const Center(
              child:  Text(
                'pagina agregar vehiculo',
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextField(
              controller: strVehiculo,
              decoration: const InputDecoration(hintText: 'Ingrese el ID_Cliente'),
            ),
            TextField(
              controller: strMarca,
              decoration: const InputDecoration(hintText: 'Ingrese el sNombreCliente'),
            ),
            TextField(
              controller: strModelo,
              decoration: const InputDecoration(hintText: 'Ingrese el sApellidosCliente'),
            ),
           
            ElevatedButton(
                onPressed: () async {
                  //print(usuariosController.text);
                  await agregarVehiculo(strVehiculo.text,strVehiculo.text, strModelo.text).then((_) {
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
