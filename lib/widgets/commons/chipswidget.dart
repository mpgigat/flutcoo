import 'package:flutter/material.dart';

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({super.key, required this.label, required this.done});
  final String label;
  final bool done;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Chip(
      labelPadding: const EdgeInsets.all(2.0),
      avatar: width > 370
          ? CircleAvatar(
              backgroundColor: Colors.white70,
              child: Text(label[0].toUpperCase()),
            )
          : null,
      label: Text(
        label,
        //width.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: done
          ? const Color.fromARGB(255, 224, 162, 81)
          : const Color.fromARGB(220, 47, 146, 44),
      // backgroundColor: colorBg,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }
}
