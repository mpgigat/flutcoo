import 'package:flutter/material.dart';

class AcordeonWidget extends StatefulWidget {
  const AcordeonWidget({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  State<AcordeonWidget> createState() => _AcordeonWidgetState();
}

class _AcordeonWidgetState extends State<AcordeonWidget> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text(
            widget.title,
            style: const TextStyle(
                fontFamily: 'Agne',
                fontWeight: FontWeight.bold,
                color: Color(0xff005c3d),
                fontSize: 18),
          ),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(widget.content),
              )
            : Container()
      ]),
    );
  }
}
