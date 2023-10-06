import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: Colors.grey,
              child: ClipPath(
                clipper: clip2(),
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("this is my Text in english"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class clip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.0025, size.height * 0.45,
        size.width * 0.5, size.height * 0.42);
    path.quadraticBezierTo(
        size.width, size.height * 0.4, size.width, size.height * 0.55);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
