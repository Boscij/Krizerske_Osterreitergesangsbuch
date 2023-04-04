// import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({
    Key key,
    @required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path)
        .replaceAll(".pdf", "")
        .replaceAll("_", " ")
        .replaceAll("Krizerske", " ");
    final text = '${indexPage + 1} / $pages';
    final textbool = name.contains('Radwor');

    return Scaffold(
      appBar: AppBar(
        title: Text(name, style: TextStyle(fontSize: 20, color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 144, 238, 144),
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: pages >= 2
            ? [
                IconButton(
                  icon: const Icon(Icons.list, size: 42),
                  color:
                      // ignore: dead_code
                      false ? Colors.black : Color.fromARGB(255, 144, 238, 144),
                  onPressed: () {
                    if ((false)) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(name),
                          content: DataTable(
                            columns: [
                              DataColumn(label: Text('Spel/Lied')),
                              DataColumn(label: Text('Strona/Seite'))
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('test1')),
                                DataCell(TextButton(
                                  child: Text('test6'),
                                  onPressed: () {
                                    controller.setPage(5);
                                    Navigator.pop(context);
                                  },
                                ))
                              ])
                            ],
                          ),
                        ),
                      );
                    } else {
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: Text('My Title Elsssse'),
                      //     content: SingleChildScrollView(
                      //       child: DataTable(
                      //         columns: [
                      //           DataColumn(label: Text('Spel/Lied')),
                      //           DataColumn(label: Text('Strona/Seite'))
                      //         ],
                      //         rows: [
                      //           DataRow(cells: [
                      //             DataCell(Text('test1')),
                      //             DataCell(TextButton(
                      //               child: Text('test6'),
                      //               onPressed: () {
                      //                 controller.setPage(5);
                      //                 Navigator.pop(context);
                      //               },
                      //             ))
                      //           ]),
                      //           DataRow(cells: [
                      //             DataCell(Text('test1')),
                      //             DataCell(TextButton(
                      //               child: Text('test6'),
                      //               onPressed: () {
                      //                 controller.setPage(5);
                      //                 Navigator.pop(context);
                      //               },
                      //             ))
                      //           ]),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // );
                    }
                    ;
                    //final page = indexPage == 0 ? pages : indexPage - 1;
                    //controller.setPage(page);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.location_searching_rounded,
                    size: 30,
                    color: textbool
                        ? Colors.black
                        : Color.fromARGB(255, 144, 238, 144),
                  ),
                  onPressed: () {
                    if ((name.contains('Radwor'))) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          //title: Text(name),
                          content: SingleChildScrollView(
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text('Městno / Ort'))
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Radwor - při cyrkwi'),
                                    onPressed: () {
                                      controller.setPage(3);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Wotjěchanje z radworja'),
                                    onPressed: () {
                                      controller.setPage(5);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Za radworjom'),
                                    onPressed: () {
                                      controller.setPage(6);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Čorny hodler'),
                                    onPressed: () {
                                      controller.setPage(7);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Miłkecy'),
                                    onPressed: () {
                                      controller.setPage(7);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Stróžišćo'),
                                    onPressed: () {
                                      controller.setPage(8);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Stróžišćo - po přestawce'),
                                    onPressed: () {
                                      controller.setPage(9);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Haslow'),
                                    onPressed: () {
                                      controller.setPage(10);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Baćoń'),
                                    onPressed: () {
                                      controller.setPage(11);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Baćoń - při cyrkwi'),
                                    onPressed: () {
                                      controller.setPage(14);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Baćoń - na nawsy'),
                                    onPressed: () {
                                      controller.setPage(15);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Haslow'),
                                    onPressed: () {
                                      controller.setPage(17);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Pomnik'),
                                    onPressed: () {
                                      controller.setPage(18);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Stróžišćo - po přestawce'),
                                    onPressed: () {
                                      controller.setPage(19);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Miłkecy'),
                                    onPressed: () {
                                      controller.setPage(20);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Čorny hodler'),
                                    onPressed: () {
                                      controller.setPage(21);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text(
                                        'Mjez čornym hodlerjom a radworjom'),
                                    onPressed: () {
                                      controller.setPage(22);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Radwor'),
                                    onPressed: () {
                                      controller.setPage(26);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Na kěrchowje'),
                                    onPressed: () {
                                      controller.setPage(27);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Wot kěrchowa k cyrkwi'),
                                    onPressed: () {
                                      controller.setPage(30);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Při cyrkwi'),
                                    onPressed: () {
                                      controller.setPage(31);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Wot cyrkwje do wsy'),
                                    onPressed: () {
                                      controller.setPage(32);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Kónčna modlitwa'),
                                    onPressed: () {
                                      controller.setPage(34);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ])
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {}
                    ;
                    //final page = indexPage == 0 ? pages : indexPage - 1;
                    //controller.setPage(page);
                  },
                ),
                Center(
                  child: Text("     "),
                ),
                Center(
                    child: Text(text,
                        style: TextStyle(fontSize: 18, color: Colors.black))),
                Center(
                  child: Text("    "),
                )
              ]
            : null,
      ),
      body: PDFView(
        filePath: widget.file.path,
        autoSpacing: false,
        fitPolicy: FitPolicy.WIDTH,
        swipeHorizontal: false,
        pageSnap: false,
        pageFling: false,
        onRender: (pages) => setState(() => this.pages = pages),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage),
      ),
    );
  }
}
