import 'dart:math';

import 'package:flutter/material.dart';
import 'package:motivasyon/model/constants.dart';
import 'package:motivasyon/model/promiseModel.dart';
import 'package:motivasyon/services/Notification.dart';
import 'package:motivasyon/services/RequestService.dart';
import 'package:motivasyon/views/Art.dart';
import 'package:motivasyon/views/Book.dart';
import 'package:motivasyon/views/Career.dart';
import 'package:motivasyon/views/Movie.dart';
import 'package:motivasyon/views/Feelings.dart';
import 'package:motivasyon/views/Health.dart';
import 'package:motivasyon/views/Technology.dart';
import 'package:motivasyon/widgets/appbar.dart';
import 'package:motivasyon/widgets/container.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'model/model.dart';
import 'views//Sport.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  late RequestService service;
  List<String>? promises;
  @override
  void initState() {
    tz.initializeTimeZones();
    service=RequestService();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final random = new Random();
          var i = random.nextInt(6);
          NotificationService().showNotification(1, "Motivation", Constants.ornekListe[i],);
        },
        backgroundColor: Color(0xffAC7D88),
        child: Icon(Icons.notifications_active),

      ),
      backgroundColor:Color(0xffFFEEEE),
      appBar:appbar(title: "Ana Sayfa"),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 60,
              child: Card(
                semanticContainer: true,
                color: Color(0xffFFF6EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 25,
                child: Center(
                  child: GradientText(
                    "Motivasyon 'başlamanı' sağlar.Devam etmen için 'alışkanlık' olmalı.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),textAlign: TextAlign.center,
                    colors: [
                      Colors.black,
                      Colors.black87,
                      Colors.black87,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 20,),
              container(color: Color(0xffEBD8C3),text: "Spor",createPage: Sport()),
              SizedBox(width: 20,),
              container(color: Color(0xffEBD8C3),text: "Sağlık",createPage: Health()),
              SizedBox(width: 20,),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20,),
              container(color: Color(0xffEBD8C3),text: "Duygular",createPage: Feelings()),
              SizedBox(width: 20,),
              container(color: Color(0xffEBD8C3),text: "Teknoloji",createPage: Technology()),
              SizedBox(width: 20,),],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20,),
              container(color: Color(0xffEBD8C3),text: "Kitaplar",createPage: Book()),
              SizedBox(width: 20,),
              container(color: Color(0xffEBD8C3),text: "Dans",createPage: Dance()),
              SizedBox(width: 20,),],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20,),container(color: Color(0xffEBD8C3),text: "Kariyer",createPage: Career()),
              SizedBox(width: 20,),
              container(color: Color(0xffEBD8C3),text: "Filmler/Diziler",createPage: Education()),
              SizedBox(width: 20,),],
          )
        ],
      ),
    );
  }
}
