import 'package:flutter/material.dart';
import 'package:motivasyon/model/model.dart';
import 'package:motivasyon/services/RequestService.dart';
class ShowPage extends StatefulWidget {
  const ShowPage({Key? key,required this.promises,required this.CategoryId}) : super(key: key);

 final List<Promises> promises;
 final int CategoryId;
  @override
  State<ShowPage> createState() => _ShowPageState();
}
class _ShowPageState extends State<ShowPage> {
  late TextEditingController valueController;
  late RequestService service;
  final formKey = GlobalKey<FormState>();
  void initState() {
    service = new RequestService();
    valueController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:  Color(0xffFFEEEE),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _displayTextInputDialog(context);
        },
        backgroundColor: Color(0xffAC7D88),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: widget.promises.length,
          itemBuilder: (context,int index){
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            //color: Color(0xffFFF6EA),
            elevation: 10,
            child: ListTile(title: Text(widget.promises[index].value!
            ,style: TextStyle(fontSize: 18.0),),leading: Icon(Icons.wb_cloudy,color: Color(0xffAC7D88),),),
          );
      }),
    );
  }
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              FlatButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    service.createDetail(widget.CategoryId, valueController.text).then((value){
                      setState(() {
                        Navigator.pop(context);
                      });
                    });
                  }
                  setState(() {
                    Navigator.pop(context);
                  });
                },

                child: Text("Kaydet", style: TextStyle(
                decoration: TextDecoration.underline,
                ),),

              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            //shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0)),
            title: Text('Söz Giriniz', ),
            content: Form(
              key: formKey,
              child: TextFormField(
                onChanged: (value) {

                },
                validator: (val){
                  if(val!.isEmpty){
                    return "Boş Geçilemez";
                  }
                  else{
                    return null;
                  }
                },
                controller: valueController,
                decoration: InputDecoration(hintText: "Söz..."),
              ),
            ),
          );
        });
  }
}
