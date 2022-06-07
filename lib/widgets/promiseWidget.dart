import 'package:flutter/material.dart';
class PromiseWidget extends StatefulWidget {
  const PromiseWidget({Key? key,required this.desc}) : super(key: key);
  final String desc;
  @override
  State<PromiseWidget> createState() => _PromiseWidgetState();
}

class _PromiseWidgetState extends State<PromiseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.desc),
    );
  }
}
