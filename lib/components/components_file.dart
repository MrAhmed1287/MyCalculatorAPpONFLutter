import 'package:flutter/material.dart';

class MyButon extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onprees;
  const MyButon(
      {Key? key,
      required this.title,
      this.color = const Color(0xffa5a5a5),
      required this.onprees})
      : super(key: key);

  @override
  State<MyButon> createState() => _MyButonState();
}

class _MyButonState extends State<MyButon> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onprees,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
            child: Center(
                child: Text(
              widget.title,
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
