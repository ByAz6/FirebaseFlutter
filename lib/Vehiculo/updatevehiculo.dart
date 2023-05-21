import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class updatevehiculo extends StatefulWidget {
   static const routeName = '/extractArguments';
  const updatevehiculo({ Key? key, required nombre, required id}) : super(key: key);
  

  @override
  State<updatevehiculo> createState() => _updatevehiculoState();
}

class _updatevehiculoState extends State<updatevehiculo> {
  TextEditingController usuariosController = TextEditingController(text: "");
  
  
  @override
  Widget build(BuildContext context) {
       final Map argumento = ModalRoute.of(context)!.settings.arguments as Map;
    final String id = argumento['id'] ; // Obtén el uid del mapa

    //pendiente el pushname y envio de info al update
     TextEditingController strVehiculo = TextEditingController(text: "");
  TextEditingController strMarca = TextEditingController(text: "");
  TextEditingController strModelo = TextEditingController(text: "");
 
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
              controller: strVehiculo,
              decoration: const InputDecoration(hintText: 'Ingrese el ID_Vehiculo'),
            ),
            TextField(
              controller: strModelo,
              decoration: const InputDecoration(hintText: 'Ingrese el sMarca'),
            ),
            TextField(
              controller: strMarca,
              decoration: const InputDecoration(hintText: 'Ingrese el sModelo'),
            ),
            
            ElevatedButton(
                onPressed: () async {
                  
                 // print(usuariosController.text);
                      print(id);
                  await actualizarvehiculo(id,strVehiculo.text,strMarca.text, strModelo.text).then((_) {
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
