

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivasyon/model/model.dart';

import 'package:motivasyon/services/RequestService.dart';
import 'package:motivasyon/views/ShowPage.dart';

import 'package:motivasyon/widgets/appbar.dart';
import 'package:motivasyon/widgets/promiseWidget.dart';


class Feelings extends StatefulWidget {
  const Feelings({Key? key}) : super(key: key);

  @override
  State<Feelings> createState() => _FeelingsState();
}

class _FeelingsState extends State<Feelings> {
  late RequestService service;
  List<Promises>? promises;
  void initState() {
    service = new RequestService();
    service.getData(6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffFFEEEE),
      appBar:appbar(title: "Duygular"),
      body: FutureBuilder<List<MotiModel>?>(
        future: service.getData(6),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasData) {
              var model = MotiModel();
              model = snap.data![0];
              promises = model.promises;
              return ShowPage(promises: promises!,CategoryId: 6,);
            } else {
              return const Text("data");
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}