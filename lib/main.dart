import 'package:flutter/material.dart';
import 'dart:math';
import 'package:proyecto/globals.dart' as globals;


//Clase de Pantalla Principal de Bienvenida
class _Bienvenida extends StatefulWidget{
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  State<StatefulWidget> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<_Bienvenida>{

  var ran = Random().nextInt(100);
  String mensaje = '';
  //static String nombre = '';
  //static String nota = '';
  void decision(){
    if ((ran % 2) == 0){
      setState(() {
        mensaje = 'Bienvenido';
      });
    }
    else{
      setState(() {
        mensaje = 'Hola';
      });
    }
  }
  @override
  Widget build(BuildContext context){
    decision();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              mensaje,
              style: _Bienvenida.optionStyle,),
            Image.asset('assets/images/img1.jpg'),
            Text(
              globals.nombre,
              style: _Bienvenida.optionStyle,),
            Text(
              globals.nota,
              style: _Bienvenida.optionStyle,),
          ],
        ),
      ),
    );
  }
}

//Clase de Cuadros de Texto
class _Cambios extends StatefulWidget{
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  State<StatefulWidget> createState() => _CambiosState();
}

class _CambiosState extends State<_Cambios>{

  late TextEditingController _controller;
  late TextEditingController _controller2;

  static const TextStyle option2Style =
  TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose(){
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              'Agrega tu nombre a la Pantalla de Inicio!',
              style: option2Style,),
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nombre",
                ),
                controller: _controller,
                onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Gracias'),
                        content: Text(
                            'Agregaste "$value" a la Pantalla de Inicio'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _controller.clear();
                              setState(() {
                                globals.nombre = value;
                              });
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Text(
                'Agrega una nota a la Pantalla de Inicio!',
                style: option2Style,),
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nota",
                ),
                controller: _controller2,
                onSubmitted: (String value2) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Gracias'),
                        content: Text(
                            'Agregaste "$value2" a la Pantalla de Inicio'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _controller2.clear();
                              setState(() {
                                globals.nota = value2;
                              });
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Clase de Calculadora
class _Calculadora extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<_Calculadora> {
  String _num2 = "";
  String _num1 = "";
  String simbolo = "";
  double doubleNum1 = 0;
  double doubleNum2 = 0;
  double resultado = 0;
  int _selectedIndex = 0;

  void _selector(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/second');
    }
  }

  void _vaciarTotal() {
    setState(() {
      _num1 = "";
      _num2 = "";
      doubleNum1 = 0;
      doubleNum2 = 0;
      simbolo = "";
    });
  }

  void _vaciar() {
    setState(() {
      _num1 = "";
    });
  }

  void _agregar7() {
    setState(() {
      _num1 += "7";
    });
  }

  void _agregar8() {
    setState(() {
      _num1 += "8";
    });
  }

  void _agregar9() {
    setState(() {
      _num1 += "9";
    });
  }

  void _agregar4() {
    setState(() {
      _num1 += "4";
    });
  }

  void _agregar5() {
    setState(() {
      _num1 += "5";
    });
  }

  void _agregar6() {
    setState(() {
      _num1 += "6";
    });
  }

  void _agregar1() {
    setState(() {
      _num1 += "1";
    });
  }

  void _agregar2() {
    setState(() {
      _num1 += "2";
    });
  }

  void _agregar3() {
    setState(() {
      _num1 += "3";
    });
  }

  void _agregar0() {
    setState(() {
      _num1 += "0";
    });
  }

  void _agregarPunto() {
    if (_num1.contains(".")) {
    } else {
      setState(() {
        _num1 += ".";
      });
    }
  }

  void _division() {
    if (_num1 == "") {
      if (_num2 == "") {
      } else {
        setState(() {
          simbolo = "/";
        });
      }
    } else {
      if (_num2 == "") {
        setState(() {
          doubleNum1 = double.parse(_num1);
          _num2 = _num1;
          _num1 = "";
          simbolo = "/";
        });
      } else {
        setState(() {
          doubleNum2 = double.parse(_num1);
          resultado = doubleNum1 / doubleNum2;
          _num2 = resultado.toString();
          _num1 = "";
        });
      }
    }
  }

  void _multiplicacion() {
    if (_num1 == "") {
      if (_num2 == "") {
      } else {
        setState(() {
          simbolo = "*";
        });
      }
    } else {
      if (_num2 == "") {
        setState(() {
          doubleNum1 = double.parse(_num1);
          _num2 = _num1;
          _num1 = "";
          simbolo = "*";
        });
      } else {
        setState(() {
          doubleNum2 = double.parse(_num1);
          resultado = doubleNum1 * doubleNum2;
          _num2 = resultado.toString();
          _num1 = "";
        });
      }
    }
  }

  void _resta() {
    if (_num1 == "") {
      if (_num2 == "") {
      } else {
        setState(() {
          simbolo = "-";
        });
      }
    } else {
      if (_num2 == "") {
        setState(() {
          doubleNum1 = double.parse(_num1);
          _num2 = _num1;
          _num1 = "";
          simbolo = "-";
        });
      } else {
        setState(() {
          doubleNum2 = double.parse(_num1);
          resultado = doubleNum1 - doubleNum2;
          _num2 = resultado.toString();
          _num1 = "";
        });
      }
    }
  }

  void _suma() {
    if (_num1 == "") {
      if (_num2 == "") {
      } else {
        setState(() {
          simbolo = "+";
        });
      }
    } else {
      if (_num2 == "") {
        setState(() {
          doubleNum1 = double.parse(_num1);
          _num2 = _num1;
          _num1 = "";
          simbolo = "+";
        });
      } else {
        setState(() {
          doubleNum2 = double.parse(_num1);
          resultado = doubleNum1 + doubleNum2;
          _num2 = resultado.toString();
          _num1 = "";
        });
      }
    }
  }

  void _igual() {
    if (_num1 == "") {
      if (_num2 == "") {
      } else {}
    } else {
      if (_num2 == "") {
      } else {
        setState(() {
          doubleNum2 = double.parse(_num1);
          switch (simbolo) {
            case "/":
              {
                resultado = doubleNum1 / doubleNum2;
                break;
              }
            case "*":
              {
                resultado = doubleNum1 * doubleNum2;
                break;
              }
            case "+":
              {
                resultado = doubleNum1 + doubleNum2;
                break;
              }
            case "-":
              {
                resultado = doubleNum1 - doubleNum2;
                break;
              }
          }
          simbolo = "";
          _num1 = resultado.toString();
          _num2 = "";
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Calculadora'),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _num2 + " " + simbolo,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              _num1,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <FloatingActionButton>[
                  FloatingActionButton(
                    //onPressed: () => [_agregar7, _vaciar],
                    onPressed: _agregar7,
                    child: const Text(
                      "7",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _agregar8,
                    child: const Text(
                      "8",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _agregar9,
                    child: const Text(
                      "9",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _division,
                    child: const Text(
                      "/",
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <FloatingActionButton>[
                  FloatingActionButton(
                    onPressed: _agregar4,
                    child: const Text(
                      "4",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _agregar5,
                    child: const Text(
                      "5",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _agregar6,
                    child: const Text(
                      "6",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _multiplicacion,
                    child: const Text(
                      "*",
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <FloatingActionButton>[
                  FloatingActionButton(
                    onPressed: _agregar1,
                    child: const Text(
                      "1",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _agregar2,
                    child: const Text(
                      "2",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _agregar3,
                    child: const Text(
                      "3",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _resta,
                    child: const Text(
                      "-",
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <FloatingActionButton>[
                  FloatingActionButton(
                    onPressed: _agregar0,
                    child: const Text(
                      "0",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _agregarPunto,
                    child: const Text(
                      ".",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _igual,
                    child: const Text(
                      "=",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _suma,
                    child: const Text(
                      "+",
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <FloatingActionButton>[
                  FloatingActionButton(
                    onPressed: _vaciar,
                    child: const Text(
                      "C",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _vaciarTotal,
                    child: const Text(
                      "CC",
                    ),
                  )
                ])
          ],
        ),
      ),
    );
  }
}

//Inicio de Main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Proyecto DEMO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    _Bienvenida(),
    _Calculadora(),
    _Cambios(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: _widgetOptions.elementAt(_selectedIndex),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Calculadora',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Cambios',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
