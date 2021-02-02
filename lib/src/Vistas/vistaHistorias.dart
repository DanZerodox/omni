import 'package:flutter/material.dart';

class VistaHistorias extends StatefulWidget {
  VistaHistorias({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VistaHistoriasState createState() => _VistaHistoriasState();
}

class _VistaHistoriasState extends State<VistaHistorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text('Prueba')),
    );
  }
}
