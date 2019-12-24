import 'package:flutter/material.dart';

class HomePageBackGround extends StatefulWidget {
  const HomePageBackGround({@required this.screenSize});
  final screenSize;

  @override
  _HomePageBackGroundState createState() => _HomePageBackGroundState();
}

class _HomePageBackGroundState extends State<HomePageBackGround> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        color: Colors.red[300],
        height: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
