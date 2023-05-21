import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class updatemdvehiculo extends StatefulWidget {
   static const routeName = '/extractArguments';
  const updatemdvehiculo({ Key? key, required nombre, required id}) : super(key: key);
  

  @override
  State<updatemdvehiculo> createState() => _updatemdvehiculoState();
}

class _updatemdvehiculoState extends State<updatemdvehiculo> {
  TextEditingController usuariosController = TextEditingController(text: "");
  
  
  @override
  Widget build(BuildContext context) {
       final Map argumento = ModalRoute.of(context)!.settings.arguments as Map;
    final String id = argumento['id'] ; // Obtén el uid del mapa

    //pendiente el pushname y envio de info al update
     TextEditingController strCliente = TextEditingController(text: "");
  TextEditingController strVehiculo = TextEditingController(text: "");
  TextEditingController sMatricula = TextEditingController(text: "");
   TextEditingController iKilometros = TextEditingController(text: "");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Usuario"),
      ),
      body: Padding(
        padding:const EdgeInsets.all(25.0),
        child: Column(
          children: [
           const Center(
              child: const Text(
                'pagina modificar usuario',
                style: TextStyle(fontSize: 24),
              ),
            ),
           TextField(
              controller: strCliente,
              decoration: const InputDecoration(hintText: 'Ingrese el ID_Vehiculo'),
            ),
            TextField(
              controller: strVehiculo,
              decoration: const InputDecoration(hintText: 'Ingrese el sMarca'),
            ),
            TextField(
              controller: sMatricula,
              decoration: const InputDecoration(hintText: 'Ingrese el sModelo'),
            ),
            TextField(
              controller: iKilometros,
              decoration: const InputDecoration(hintText: 'Ingrese el sModelo'),
            ),
            
            ElevatedButton(
                onPressed: () async {
                  
                 // print(usuariosController.text);
                      print(id);
                  await actualizarclientevehiculo(id,strCliente.text,strVehiculo.text, sMatricula.text,iKilometros.text ).then((_) {
                    Navigator.pop(context);
                  });
                  //   Navigator.pop(context);
                },
                child:const Text("Actualizar"))
          ],
        ),
      ),
    );
  }
}
