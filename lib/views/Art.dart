

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivasyon/model/model.dart';

import 'package:motivasyon/services/RequestService.dart';
import 'package:motivasyon/views/ShowPage.dart';

import 'package:motivasyon/widgets/appbar.dart';
import 'package:motivasyon/widgets/promiseWidget.dart';


class Dance extends StatefulWidget {
  const Dance({Key? key}) : super(key: key);

  @override
  State<Dance> createState() => _DanceState();
}

class _DanceState extends State<Dance> {
  late RequestService service;
  List<Promises>? promises;
  void initState() {
    service = new RequestService();
    service.getData(3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbar(title: "Dans"),
      body: Container(
        color: Color(0xffFFEEEE),
        child: FutureBuilder<List<MotiModel>?>(
          future: service.getData(3),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              if (snap.hasData) {
                var model = MotiModel();
                model = snap.data![0];
                promises = model.promises;
                return ShowPage(promises: promises!,CategoryId: 3,);
              } else {
                return const Text("data");
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}