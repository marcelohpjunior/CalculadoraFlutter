import 'package:app01/calculadora-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Calculadora());
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  IconData _operador;
  final TextEditingController  _val1 = TextEditingController();
  TextEditingController _val2 = TextEditingController();
  num _resultado = 0;
  CalculadoraModel calculadora = CalculadoraModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Calculadora"),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _val1.text = "";
                    _val2.text = "";
                    _operador = null;
                    _resultado = 0;
                  });
                },
              )
            ]),
        backgroundColor: Color.fromRGBO(17, 202, 156, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Image.network(
                      'http://icons.iconarchive.com/icons/dtafalonso/android-l/512/Calculator-icon.png',
                      height: 150,
                    ),
                  ),
                  Flexible(
                      child: Container(
                    margin: EdgeInsets.only(right: 10, top: 10),
                    width: double.maxFinite,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _resultado.toString().length > 5
                              ? _resultado.toStringAsPrecision(4)
                              : _resultado.toString(),
                          style: TextStyle(fontSize: 65),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextField(
                        controller: _val1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Valor 1",
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Icon(
                        _operador,
                        color: Colors.grey[800],
                      )),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        controller: _val2,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Valor 2",
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.grey[800],
                          ),
                          onPressed: () {
                            setState(() {
                              _operador = FontAwesomeIcons.plus;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.grey[800],
                          ),
                          onPressed: () {
                            setState(() {
                              _operador = FontAwesomeIcons.minus;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.times,
                            color: Colors.grey[800],
                          ),
                          onPressed: () {
                            setState(() {
                              _operador = FontAwesomeIcons.times;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.divide,
                            color: Colors.grey[800],
                          ),
                          onPressed: () {
                            setState(() {
                              _operador = FontAwesomeIcons.divide;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                margin: EdgeInsets.only(bottom: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  color: Colors.teal,
                  child: Text(
                    "Resultado",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_val1.text.isNotEmpty ||
                        _val2.text.isNotEmpty ||
                        _operador != null) {
                      if (_operador == FontAwesomeIcons.plus) {
                        setState(() {
                          _resultado =
                              calculadora.somar(_val1.text, _val2.text);
                        });
                      }
                      if (_operador == FontAwesomeIcons.minus) {
                        setState(() {
                          _resultado =
                              calculadora.subtrair(_val1.text, _val2.text);
                        });
                      }
                      if (_operador == FontAwesomeIcons.times) {
                        setState(() {
                          _resultado =
                              calculadora.multiplicar(_val1.text, _val2.text);
                        });
                      }
                      if (_operador == FontAwesomeIcons.divide) {
                        setState(() {
                          _resultado =
                              calculadora.dividir(_val1.text, _val2.text);
                        });
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
