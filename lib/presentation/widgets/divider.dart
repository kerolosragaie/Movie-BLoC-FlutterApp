import 'package:flutter/material.dart';

//A divider between data info:
class DividerPro extends StatelessWidget {
  final double endIndent;
  const DividerPro({Key? key, required this.endIndent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white,
      thickness: 2,
      endIndent: endIndent,
    );
  }
}
