import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gradient Effects"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.purple, Colors.red])),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (rect) => LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.indigoAccent, Colors.pink])
                  .createShader(rect),
              child: Text("Gradient Text"),
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    final shape = StadiumBorder();

    return Material(
      color: Colors.transparent,
      shape: shape,
      elevation: 8,
      child: Container(
        decoration: ShapeDecoration(
            shape: shape,
            gradient: LinearGradient(
                colors: [Colors.red, Colors.orange, Colors.indigo])),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),

                ///deactivate color and shadow
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 20),
            onPressed: () {},
            child: Text(
              "Gradient Button",
              style: TextStyle(fontSize: 28),
            )),
      ),
    );
  }
}
