import 'dart:io';

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:krizerske_osterreitergesangsbuch/api/pdf_api.dart';
import 'package:krizerske_osterreitergesangsbuch/button/button.dart';
import 'package:krizerske_osterreitergesangsbuch/api/pdf_api.dart';
import 'package:krizerske_osterreitergesangsbuch/page/pdf_viewer_page.dart';
//import 'package:pdf_viewer_example/page/pdf_viewer_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Křižerske Kulow',
                onClicked: () async {
                  const path = 'assets/Krizerske_Kulow.pdf';
                  final file = await PDFApi.loadAsset(path);
                  openPDF(context, file);
                },
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: 'Křižerske Ralbicy',
                onClicked: () async {
                  const path = 'assets/Krizerske_Ralbicy.pdf';
                  final file = await PDFApi.loadAsset(path);
                  openPDF(context, file);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
