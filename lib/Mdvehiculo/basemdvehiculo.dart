import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';
import 'package:flutter_firebaseapp/pantallas/update_usuer.dart';


class basemdvehiculo extends StatefulWidget {
  const basemdvehiculo({super.key});

  @override
  State<basemdvehiculo> createState() => _basemdvehiculoState();
}

class _basemdvehiculoState extends State<basemdvehiculo> {
  @override
  //_llave =UniqueKey();
  Widget build(BuildContext context) {
    return Scaffold(
        
          appBar: AppBar(
            title: const Text('VEHICULOS'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: FutureBuilder(
              future: getmdvh(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: ((context, index) {
                        //return Text(snapshot.data?[index]['nombre']);
                        return Dismissible(
                          confirmDismiss: (direction) async {
                            print("Confirmacion de borrado");
                            eliminar(snapshot.data?[index]['id'],'MD_ClienteVehiculo');
                            return true;
                          },
                          background: Container(
                            color: (Colors.red),
                            child: const Icon(Icons.delete),
                          ),
                          direction: DismissDirection.endToStart,
                          key:  UniqueKey(),
                          //Key(Text(snapshot.data?[index]['uid']))
                          child: ListTile(
                            title: Text(snapshot.data?[index]['ID_Cliente']),
                            /* onTap: (() async {
                              print(Text(snapshot.data?[index]['nombre']));
                              print(context);
                              Navigator.pushNamed(context, '/edit',
                                  arguments:/* {
                                    "nombre":snapshot.data?[index]['nombre']
                                  }*/
                                 // ArgumentoEditar()
                                  );
                            }),*/

                            onTap: (() async {
                              await Navigator.pushNamed(context, '/edit',
                                  arguments: {
                                    'strCliente': snapshot.data?[index]['ID_Cliente'],
                                    'strVehiculo': snapshot.data?[index]['ID_Vehiculo'],
                                    'sMatricula': snapshot.data?[index]['sMatricula'],
                                    'iKilometros': snapshot.data?[index]['iKilometros'],
                                   'id':  snapshot.data?[index]['id'],
                                  });
                              setState(() {});
                            }),
                          ),
                        );
                        //print("datos");
                      }));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(context, '/add');
              setState(() {});
              //print("Actualizar");
            },
            child: const Icon(Icons.add),
          ),
        );
  }
}