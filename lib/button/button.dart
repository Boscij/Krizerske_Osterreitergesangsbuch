import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 144, 238, 144),
          minimumSize: Size.fromHeight(50),
        ),
        child: Text(text, style: TextStyle(fontSize: 20, color: Colors.black)),
        onPressed: onClicked,
      );
}
