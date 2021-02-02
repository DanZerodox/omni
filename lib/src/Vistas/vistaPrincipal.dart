import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class VistaPrincipal extends StatefulWidget {
  VistaPrincipal({Key key, this.titulo, this.precio, this.likes, this.imagen})
      : super(key: key);

  final String titulo;
  final String precio;
  final int likes;
  final String imagen;

  @override
  _VistaPrincipalState createState() => _VistaPrincipalState();
}

class _VistaPrincipalState extends State<VistaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.imagen), fit: BoxFit.cover)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        widget.titulo,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "\$" + widget.precio + " MXN",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                new Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Icon(
                                LineAwesomeIcons.heart,
                                size: 20.0,
                                color: Colors.red,
                              ),
                              new Text(widget.likes > 1000
                                  ? widget.likes.toString().substring(0, 1) +
                                      "k"
                                  : widget.likes.toString()),
                              new Icon(
                                LineAwesomeIcons.comment,
                                size: 20.0,
                                color: Colors.grey,
                              ),
                              new Text(widget.likes > 1000
                                  ? widget.likes.toString().substring(0, 1) +
                                      "k"
                                  : widget.likes.toString())
                            ])),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
