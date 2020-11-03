import 'package:bsrb/user/user_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class AboutPage extends StatefulWidget {
  @override
  _AboutState createState() => new _AboutState();
}

class _AboutState extends State<AboutPage> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => User()));
          },
        ),
        title: Text("Tentang BSRB"),
      ),
      body: Center(
          child: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          print(details);
          _previousScale = _scale;
          setState(() {});
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          print(details);
          _scale = _previousScale * details.scale;
          setState(() {});
        },
        onScaleEnd: (ScaleEndDetails details) {
          print(details);
          _previousScale = 1.0;
          setState(() {});
        },
        child: RotatedBox(
          quarterTurns: 0,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
              child: Image(
                image: AssetImage("assets/About_BSRB.png"),
              ),
            ),
          ),
        ),
      )
          //   child: Container(
          //     padding: EdgeInsets.all(5),
          //     child: Image(image: AssetImage("assets/About_BSRB.png")),
          //   ),
          ),
    );
  }
}
