import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function onChanged;
  const SearchTextField(
      {Key? key, required this.textEditingController, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: "Find a charcther",
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
        border: InputBorder.none,
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: (val) => onChanged(val),
    );
  }
}
