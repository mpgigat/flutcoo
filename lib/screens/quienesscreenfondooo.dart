import 'package:flutter/material.dart';

class QuienesScreen extends StatefulWidget {
  const QuienesScreen(
      {super.key,
      required this.height,
      required this.showIcon,
      required this.icon});
  final double height;
  final bool showIcon;
  final IconData icon;

  @override
  State<QuienesScreen> createState() => _QuienesScreenState();
}

class _QuienesScreenState extends State<QuienesScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, widget.height),
            Offset(width / 10 * 5, widget.height - 60),
            Offset(width / 5 * 4, widget.height + 20),
            Offset(width, widget.height - 18)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 3, widget.height + 20),
            Offset(width / 10 * 8, widget.height - 60),
            Offset(width / 5 * 4, widget.height - 60),
            Offset(width, widget.height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, widget.height),
            Offset(width / 2, widget.height - 40),
            Offset(width / 5 * 4, widget.height - 80),
            Offset(width, widget.height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        Visibility(
          visible: widget.showIcon,
          child: SizedBox(
            height: widget.height - 40,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                  left: 5.0,
                  top: 20.0,
                  right: 5.0,
                  bottom: 20.0,
                ),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  border: Border.all(width: 5, color: Colors.white),
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> offsets = [];
  ShapeClipper(this.offsets);

  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height - 20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(
        offsets[0].dx, offsets[0].dy, offsets[1].dx, offsets[1].dy);
    path.quadraticBezierTo(
        offsets[2].dx, offsets[2].dy, offsets[3].dx, offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
