import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double sizeIcon = 300;
  double red = 0;
  double blue = 0;
  double green = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Exemplo'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (sizeIcon > 50) {
                    sizeIcon = sizeIcon - 50;
                  }
                });
              },
              icon: const Icon(Icons.remove)),
          IconButton(
              onPressed: () {
                setState(() {
                  sizeIcon = 50;
                });
              },
              icon: const Text('S')),
          IconButton(
              onPressed: () {
                setState(() {
                  sizeIcon = 300;
                });
              },
              icon: const Text('M')),
          IconButton(
              onPressed: () {
                setState(() {
                  sizeIcon = 500;
                });
              },
              icon: const Text('L')),
          IconButton(
              onPressed: () {
                setState(() {
                  if (sizeIcon < 500) {
                    sizeIcon = sizeIcon + 50;
                  }
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Center(
              child:
                  Icon(Icons.alarm, size: sizeIcon, color: Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 50))),
          Slider(
            min: 0,
            max: 255,
            divisions: 255,
            value: red,
            onChanged: (double value) {
              setState(() {
                red = value;
              });
            },
            activeColor: Colors.red,
          ),
          Slider(
            min: 0,
            max: 255,
            divisions: 255,
            value: green,
            onChanged: (double value) {
              setState(() {
                green = value;
              });
            },
            activeColor: Colors.green,
          ),
          Slider(
            min: 0,
            max: 255,
            divisions: 255,
            value: blue,
            onChanged: (double value) {
              setState(() {
                blue = value;
              });
            },
            activeColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
