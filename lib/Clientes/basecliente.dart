import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';
import 'package:flutter_firebaseapp/pantallas/update_usuer.dart';


class basecliente extends StatefulWidget {
  const basecliente({super.key});

  @override
  State<basecliente> createState() => _baseclienteState();
}

class _baseclienteState extends State<basecliente> {
  @override
  //_llave =UniqueKey();
  Widget build(BuildContext context) {
    return Scaffold(
        
          appBar: AppBar(
            title: const Text('CLIENTES'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: FutureBuilder(
              future: getclientes(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: ((context, index) {
                        //return Text(snapshot.data?[index]['nombre']);
                        return Dismissible(
                          confirmDismiss: (direction) async {
                            print("Confirmacion de borrado");
                            eliminar(snapshot.data?[index]['id'],'MD_CLientes');
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
                            title: Text(snapshot.data?[index]['sNombreCliente']),
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
                                    'ID_Cliente': snapshot.data?[index]['ID_Cliente'],
                                    'sNombreCliente': snapshot.data?[index]['sNombreCliente'],
                                    'sApellidosCliente': snapshot.data?[index]['sApellidosCliente'],
                                    'sDireccionCliente': snapshot.data?[index]['sDireccionCliente'],
                                    'sCiudadCliente': snapshot.data?[index]['sCiudadCliente'],
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