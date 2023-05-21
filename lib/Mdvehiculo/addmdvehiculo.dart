import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class addmdvehiculo extends StatefulWidget {
  const addmdvehiculo({super.key});

  @override
  State<addmdvehiculo> createState() => _addmdvehiculoState();
}

class _addmdvehiculoState extends State<addmdvehiculo> {
  TextEditingController strCliente = TextEditingController(text: "");
  TextEditingController strVehiculo = TextEditingController(text: "");
  TextEditingController strMatricula = TextEditingController(text: "");
  TextEditingController douKilometros = TextEditingController(text: "");
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
                'pagina agregar MD vehiculo',
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextField(
              controller: strCliente,
              decoration: const InputDecoration(hintText: 'Ingrese el ID_Cliente'),
            ),
            TextField(
              controller: strVehiculo,
              decoration: const InputDecoration(hintText: 'Ingrese el sNombreCliente'),
            ),
            TextField(
              controller: strMatricula,
              decoration: const InputDecoration(hintText: 'Ingrese el sApellidosCliente'),
            ),
            TextField(
              controller: douKilometros,
              decoration: const InputDecoration(hintText: 'Ingrese el sApellidosCliente'),
            ),
            ElevatedButton(
                onPressed: () async {
                  //print(usuariosController.text);
                  await agregarClienteVehiculo(strCliente.text,strVehiculo.text, strMatricula.text, douKilometros.text  ).then((_) {
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
