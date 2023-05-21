import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class updatecliente extends StatefulWidget {
   static const routeName = '/extractArguments';
  const updatecliente({ Key? key, required nombre, required id}) : super(key: key);
  

  @override
  State<updatecliente> createState() => _updateclienteState();
}

class _updateclienteState extends State<updatecliente> {
  TextEditingController usuariosController = TextEditingController(text: "");
  
  
  @override
  Widget build(BuildContext context) {
       final Map argumento = ModalRoute.of(context)!.settings.arguments as Map;
    final String id = argumento['id'] ; // Obtén el uid del mapa

    //pendiente el pushname y envio de info al update
     TextEditingController ID_Cliente = TextEditingController(text: "");
  TextEditingController sNombreCliente = TextEditingController(text: "");
  TextEditingController sApellidosCliente = TextEditingController(text: "");
  TextEditingController sDireccionCliente = TextEditingController(text: "");
  TextEditingController sCiudadCliente = TextEditingController(text: "");
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
                  
                  print(usuariosController.text);
                      print(id);
                  await actualizarcliente(id,ID_Cliente.text,sNombreCliente.text, sApellidosCliente.text, sDireccionCliente.text,sCiudadCliente.text,).then((_) {
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
