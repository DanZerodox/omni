import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:omni/src/Constantes/data_json.dart';
import 'package:omni/src/Vistas/vistaHistorias.dart';
import 'package:omni/src/Vistas/vistaPrincipal.dart';

class ControladorVistas extends StatefulWidget {
  @override
  _ControladorVistasState createState() => _ControladorVistasState();
}

class _ControladorVistasState extends State<ControladorVistas> {
  int pageIndex = 0;
  int activeMenu = 0;
  PageController _controller =
      PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _inicio() {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: List.generate(dataItems.length, (index) {
          return VistaPrincipal(
            titulo: dataItems[index]['Titulo'],
            precio: dataItems[index]['Precio'],
            likes: dataItems[index]['Likes'],
            imagen: dataItems[index]['Imagen'],
          );
        }),
      ),
    );
  }

  Widget getBody() {
    List<Widget> pages = [_inicio(), VistaHistorias()];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Bienvenido Daniel',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  // Image.asset(
                  //   'assets/images/sag4.png',
                  //   width: 70,
                  // ),
                  Row(
                    children: <Widget>[
                      Icon(
                        LineAwesomeIcons.search,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(LineAwesomeIcons.bell),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(LineAwesomeIcons.shopping_cart)
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: List.generate(menuItems.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: InkWell(
                        onTap: () {
                          selectedTab(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: activeMenu == index
                                          ? Colors.blue[900]
                                          : Colors.transparent,
                                      width: 2))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(menuItems[index],
                                style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ));
                }),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _inicio()
        ],
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      activeMenu = index;
      pageIndex = index;
    });
  }
}
