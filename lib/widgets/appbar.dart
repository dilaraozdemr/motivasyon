import 'package:flutter/material.dart';
class appbar extends StatelessWidget implements PreferredSizeWidget{
  appbar({
    Key? key, required this.title
  }) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: true,backgroundColor: Color(0xffAC7D88),
      title: Text(title, style: TextStyle(color: Colors.black,fontSize: 22.0),),
      foregroundColor: Colors.black,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
