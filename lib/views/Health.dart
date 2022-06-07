

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivasyon/model/model.dart';

import 'package:motivasyon/services/RequestService.dart';
import 'package:motivasyon/views/ShowPage.dart';

import 'package:motivasyon/widgets/appbar.dart';
import 'package:motivasyon/widgets/promiseWidget.dart';


class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  late RequestService service;
  List<Promises>? promises;
  void initState() {
    service = new RequestService();
    service.getData(7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbar(title: "Sağlık"),
      body: FutureBuilder<List<MotiModel>?>(
        future: service.getData(7),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasData) {
              var model = MotiModel();
              model = snap.data![0];
              promises = model.promises;
              return ShowPage(promises: promises!,CategoryId: 7,);
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