import 'package:flutter/material.dart';
class container extends StatelessWidget {
  container({
    Key? key,required this.color,required this.text,required this.createPage
  }) : super(key: key);
  Color color;
  String text;
  Widget createPage;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>createPage,
              ));
        },
        child: Card(
          elevation: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),

          child: Container(width: 150,height: 100,
            child: Center(child: Text(text, style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontStyle: FontStyle.normal,
            ),)),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
      ),
    );
  }
}