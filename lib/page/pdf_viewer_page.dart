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
        .replaceAll("Krizerske", " ")
        .replaceAll("Osterreitergesangsbuch", " ");
    final text = '${indexPage + 1} / $pages';
    final textbool = name.contains('Radwor') ||
        name.contains('Kulow') ||
        name.contains('Ralbicy') ||
        name.contains('Wittichenau');

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
                      (name.contains('Kulow') ||
                              name.contains('Ralbicy') ||
                              name.contains('Radwor'))
                          ? Colors.black
                          : Color.fromARGB(255, 144, 238, 144),
                  onPressed: () {
                    if (name.contains('Kulow')) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: SingleChildScrollView(
                                  child: DataTable(
                                    columns: [
                                      DataColumn(label: Text('Kěrluš / Lied'))
                                      //DataColumn(label: Text('Wosadnik'))
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '1 - Te Deum / Tebje my Boha chwalimy (wos. 462)'),
                                          onPressed: () {
                                            controller.setPage(10);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '2 - Chryst mortwy je so wubudźił (wos. 373)'),
                                          onPressed: () {
                                            controller.setPage(12);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '3 - Net weriwi so wjeselmy (wos. 370)'),
                                          onPressed: () {
                                            controller.setPage(13);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '4 - Dźens Chrystus z mortwych stanył je (wos. 363)'),
                                          onPressed: () {
                                            controller.setPage(14);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '5 - Chryst je z mortwych stanył (wos. 367)'),
                                          onPressed: () {
                                            controller.setPage(14);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '6 - Dźens Boži Syn so raduje (wos. 364)'),
                                          onPressed: () {
                                            controller.setPage(15);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '7 - Budź chwała Bohu wěčnemu (wos. 368)'),
                                          onPressed: () {
                                            controller.setPage(16);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '8 - Raduj so, njebjes Kralowna (wos. 378)'),
                                          onPressed: () {
                                            controller.setPage(17);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '9 - Haleluja! Zwońće zwony! (wos. 376)'),
                                          onPressed: () {
                                            controller.setPage(19);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '10 - Tón cyły swět so raduje (wos. 365)'),
                                          onPressed: () {
                                            controller.setPage(19);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '11 - Je přišoł dźeń najzbóžniši (wos. 362)'),
                                          onPressed: () {
                                            controller.setPage(20);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '12 - Wón dobył je, naš Wumóžnik (wos. 375)'),
                                          onPressed: () {
                                            controller.setPage(21);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '13 - Budź chwalen Jězus Chrystus (wos. 439)'),
                                          onPressed: () {
                                            controller.setPage(22);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '14 - Dźens Marija z časa dźe (wos. 551)'),
                                          onPressed: () {
                                            controller.setPage(24);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '15 - Nět radujmy so wutrobnje (wos. 439)'),
                                          onPressed: () {
                                            controller.setPage(24);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '16 - Maći Boža, proš za nas Jězusa! (wos. 559)'),
                                          onPressed: () {
                                            controller.setPage(25);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              '17 - Požohnuj nas z wysoka (wos. 165)'),
                                          onPressed: () {
                                            controller.setPage(27);
                                            Navigator.pop(context);
                                          },
                                        )),
                                      ])
                                    ],
                                  ),
                                ),
                              ));
                    } else {
                      if (name.contains('Ralbicy')) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: SingleChildScrollView(
                                    child: DataTable(
                                      columns: [
                                        DataColumn(label: Text('Kěrluš / Lied'))
                                        //DataColumn(label: Text('Wosadnik'))
                                      ],
                                      rows: [
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Te Deum / Tebje my Boha chwalimy (wos. 462)'),
                                            onPressed: () {
                                              controller.setPage(2);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Chryst mortwy je so wubudźił (wos. 373)'),
                                            onPressed: () {
                                              controller.setPage(4);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Net weriwi so wjeselmy (wos. 370)'),
                                            onPressed: () {
                                              controller.setPage(7);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Dźens Chrystus z mortwych stanył je (wos. 363)'),
                                            onPressed: () {
                                              controller.setPage(18);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Chryst je z mortwych stanył (wos. 367)'),
                                            onPressed: () {
                                              controller.setPage(16);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Dźens Boži Syn so raduje (wos. 364)'),
                                            onPressed: () {
                                              controller.setPage(11);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Budź chwała Bohu wěčnemu (wos. 368)'),
                                            onPressed: () {
                                              controller.setPage(3);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Raduj so, njebjes Kralowna (wos. 378)'),
                                            onPressed: () {
                                              controller.setPage(8);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Haleluja! Zwońće zwony! (wos. 376)'),
                                            onPressed: () {
                                              controller.setPage(9);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Tón cyły swět so raduje (wos. 365)'),
                                            onPressed: () {
                                              controller.setPage(24);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Je přišoł dźeń najzbóžniši (wos. 362)'),
                                            onPressed: () {
                                              controller.setPage(6);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Wón dobył je, naš Wumóžnik (wos. 375)'),
                                            onPressed: () {
                                              controller.setPage(13);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Swěru kraley přisahajmy (wos. 446)'),
                                            onPressed: () {
                                              controller.setPage(33);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Nět radujmy so wutrobnje (wos. 439)'),
                                            onPressed: () {
                                              controller.setPage(10);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Tón cyły swět so raduje (wos. 365)'),
                                            onPressed: () {
                                              controller.setPage(24);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Dźěćo pohanskeho krala (wos. 583)'),
                                            onPressed: () {
                                              controller.setPage(37);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Božo, Ty, Serbow wodźił sy (wos. 483)'),
                                            onPressed: () {
                                              controller.setPage(37);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(TextButton(
                                            child: Text(
                                                'Daj, Knježe, z Twojim žohnowanjom (wos. 175)'),
                                            onPressed: () {
                                              controller.setPage(38);
                                              Navigator.pop(context);
                                            },
                                          )),
                                        ])
                                      ],
                                    ),
                                  ),
                                ));
                      } else {
                        if (name.contains('Radwor')) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: SingleChildScrollView(
                                      child: DataTable(
                                        columns: [
                                          DataColumn(
                                              label: Text('Kěrluš / Lied'))
                                          //DataColumn(label: Text('Wosadnik'))
                                        ],
                                        rows: [
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Te Deum / Tebje my Boha chwalimy (wos. 462)'),
                                              onPressed: () {
                                                controller.setPage(30);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Chryst mortwy je so wubudźił (wos. 373)'),
                                              onPressed: () {
                                                controller.setPage(7);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Net weriwi so wjeselmy (wos. 370)'),
                                              onPressed: () {
                                                controller.setPage(7);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Dźens Chrystus z mortwych stanył je (wos. 363)'),
                                              onPressed: () {
                                                controller.setPage(4);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Chryst je z mortwych stanył (wos. 367)'),
                                              onPressed: () {
                                                controller.setPage(7);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Dźens Boži Syn so raduje (wos. 364)'),
                                              onPressed: () {
                                                controller.setPage(5);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Budź chwała Bohu wěčnemu (wos. 368)'),
                                              onPressed: () {
                                                controller.setPage(5);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Raduj so, njebjes Kralowna (wos. 378)'),
                                              onPressed: () {
                                                controller.setPage(15);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Haleluja! Zwońće zwony! (wos. 376)'),
                                              onPressed: () {
                                                controller.setPage(11);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Tón cyły swět so raduje (wos. 365)'),
                                              onPressed: () {
                                                controller.setPage(8);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Je přišoł dźeń najzbóžniši (wos. 362)'),
                                              onPressed: () {
                                                controller.setPage(19);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Wón dobył je, naš Wumóžnik (wos. 375)'),
                                              onPressed: () {
                                                controller.setPage(17);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Swěru kraley přisahajmy (wos. 446)'),
                                              onPressed: () {
                                                controller.setPage(9);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Nět radujmy so wutrobnje (wos. 439)'),
                                              onPressed: () {
                                                controller.setPage(31);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Tón cyły swět so raduje (wos. 365)'),
                                              onPressed: () {
                                                controller.setPage(8);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Kralowna njebjes Regina cæli (wos. 380)'),
                                              onPressed: () {
                                                controller.setPage(3);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Božo, Ty, Serbow wodźił sy (wos. 483)'),
                                              onPressed: () {
                                                controller.setPage(18);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Daj, Knježe, z Twojim žohnowanjom (wos. 175)'),
                                              onPressed: () {
                                                controller.setPage(33);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Jězus, Jězus je to mjeno (wos. 434)'),
                                              onPressed: () {
                                                controller.setPage(12);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Njech w njebjesach, na zemi (wos. 451)'),
                                              onPressed: () {
                                                controller.setPage(14);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Knježna swjata, maći Boža (wos. 558)'),
                                              onPressed: () {
                                                controller.setPage(31);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(TextButton(
                                              child: Text(
                                                  'Kěrluš k zbóžnemu martrarjej, kapłanej Alojsej (wos. 600)'),
                                              onPressed: () {
                                                controller.setPage(33);
                                                Navigator.pop(context);
                                              },
                                            )),
                                          ])
                                        ],
                                      ),
                                    ),
                                  ));
                        } else {}
                      }
                    }
                    ;
                  },
                ),
                Center(
                  child: Text("  "),
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
                                    child: Text('Wotjěchanje z Radworja'),
                                    onPressed: () {
                                      controller.setPage(5);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ]),
                                DataRow(cells: [
                                  DataCell(TextButton(
                                    child: Text('Za Radworjom'),
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
                                      controller.setPage(35);
                                      Navigator.pop(context);
                                    },
                                  ))
                                ])
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      if ((name.contains('Kulow'))) {
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
                                    DataCell(
                                      TextButton(
                                        child:
                                            Text('Kulow čo.: 4 - 10 / 4 ...'),
                                        onPressed: () {
                                          controller.setPage(14);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy za Kulowom'),
                                      onPressed: () {
                                        controller.setPage(0);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Hózk čo.: 2 - 3 ...'),
                                      onPressed: () {
                                        controller.setPage(12);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy za Hózkom'),
                                      onPressed: () {
                                        controller.setPage(0);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Koćina čo.: 4 - 6 ...'),
                                      onPressed: () {
                                        controller.setPage(14);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy za Kocinu'),
                                      onPressed: () {
                                        controller.setPage(1);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Konjecy čo.: 11 - 12 ...'),
                                      onPressed: () {
                                        controller.setPage(20);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy za Konjecami'),
                                      onPressed: () {
                                        controller.setPage(4);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child:
                                          Text('Ralbicy čo.: 4 - 10 / 4 ...'),
                                      onPressed: () {
                                        controller.setPage(14);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy na nyšporie'),
                                      onPressed: () {
                                        controller.setPage(5);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text(
                                          'Ralbicy po nyšporje \nčo.: 1 - 3 / 6 - 9 / 2 ...'),
                                      onPressed: () {
                                        controller.setPage(10);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy za Ralbicami'),
                                      onPressed: () {
                                        controller.setPage(6);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text(
                                          'Konjecy / Šunow čo.: 4 - 7 ...'),
                                      onPressed: () {
                                        controller.setPage(14);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy za Šunow'),
                                      onPressed: () {
                                        controller.setPage(8);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Sulšecy čo.: 8 - 9 + 15'),
                                      onPressed: () {
                                        controller.setPage(17);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy za Sulšecami'),
                                      onPressed: () {
                                        controller.setPage(8);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Salow čo.: 9 - 10 '),
                                      onPressed: () {
                                        controller.setPage(19);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Modlitwy za Salowom'),
                                      onPressed: () {
                                        controller.setPage(9);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text(
                                          'Kulow \nčo.: 1 - 3 / 7 - 12 + 14 / 2 ...'),
                                      onPressed: () {
                                        controller.setPage(11);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ]),
                                  DataRow(cells: [
                                    DataCell(TextButton(
                                      child: Text('Wotpuskny paćer'),
                                      onPressed: () {
                                        controller.setPage(9);
                                        Navigator.pop(context);
                                      },
                                    ))
                                  ])
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        if ((name.contains('Ralbicy'))) {
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
                                      DataCell(
                                        TextButton(
                                          child: Text('Rańša modlitwa na puć'),
                                          onPressed: () {
                                            controller.setPage(1);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Ralbicy'),
                                        onPressed: () {
                                          controller.setPage(2);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Za Ralbicami'),
                                        onPressed: () {
                                          controller.setPage(5);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Konjecy a Šunow'),
                                        onPressed: () {
                                          controller.setPage(6);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Za Šunowom'),
                                        onPressed: () {
                                          controller.setPage(8);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Sulšecy'),
                                        onPressed: () {
                                          controller.setPage(8);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Salow'),
                                        onPressed: () {
                                          controller.setPage(10);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Za Salowom'),
                                        onPressed: () {
                                          controller.setPage(12);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Kulow'),
                                        onPressed: () {
                                          controller.setPage(13);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Kulow po nyšporje'),
                                        onPressed: () {
                                          controller.setPage(18);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Hózk'),
                                        onPressed: () {
                                          controller.setPage(23);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Za Hózkom'),
                                        onPressed: () {
                                          controller.setPage(24);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Koćina'),
                                        onPressed: () {
                                          controller.setPage(28);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Za Koćinu'),
                                        onPressed: () {
                                          controller.setPage(29);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Konjecy'),
                                        onPressed: () {
                                          controller.setPage(29);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Za Konjecami'),
                                        onPressed: () {
                                          controller.setPage(31);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Ralbicy'),
                                        onPressed: () {
                                          controller.setPage(32);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Zakónčaca modlitwa'),
                                        onPressed: () {
                                          controller.setPage(36);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(TextButton(
                                        child: Text('Wućah'),
                                        onPressed: () {
                                          controller.setPage(37);
                                          Navigator.pop(context);
                                        },
                                      ))
                                    ])
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          if ((name.contains('Wittichenau'))) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                //title: Text(name),
                                content: SingleChildScrollView(
                                  child: DataTable(
                                    columns: [DataColumn(label: Text('Ort'))],
                                    rows: [
                                      DataRow(cells: [
                                        DataCell(
                                          TextButton(
                                            child: Text(
                                                'In Wittichenau Nr. 1 bis 10'),
                                            onPressed: () {
                                              controller.setPage(2);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        )
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Zwischen Wittichenau und Hoske Freudenreicher Rosenkranz'),
                                          onPressed: () {
                                            controller.setPage(6);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text('In Hoske Nr. 1 und 3'),
                                          onPressed: () {
                                            controller.setPage(2);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Zwischen Hoske und Kotten Freudenreicher Rosenkranz'),
                                          onPressed: () {
                                            controller.setPage(6);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text('In Kotten Nr. 7 und 8'),
                                          onPressed: () {
                                            controller.setPage(7);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Zwischen Kotten und Cunnewitz Schmerzhafter Rosenkranz'),
                                          onPressed: () {
                                            controller.setPage(7);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child:
                                              Text('In Cunnewitz Nr. 8 bis 10'),
                                          onPressed: () {
                                            controller.setPage(8);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Zwischen Cunnewitz und Ralbitz Österlicher Rosenkranz'),
                                          onPressed: () {
                                            controller.setPage(9);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'In Ralbitz Nr. 1 bis 8 (und Alleluja)'),
                                          onPressed: () {
                                            controller.setPage(2);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text('In Ralbitz Alleluja'),
                                          onPressed: () {
                                            controller.setPage(27);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'In Ralbitz nach der Kreuzaufnahme Nr. 11'),
                                          onPressed: () {
                                            controller.setPage(10);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'In Ralbitz nach der Kreuzaufnahme Nr. 23 bis 25'),
                                          onPressed: () {
                                            controller.setPage(23);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Zwischen Ralbitz und Cunnewitz Glorreicher Rosenkranz'),
                                          onPressed: () {
                                            controller.setPage(10);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'In Cunnewitz und Schönau Nr. 12 bis 14'),
                                          onPressed: () {
                                            controller.setPage(11);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Zwischen Schönau und Sollschwitz Kreuzverehrung (und Nr. 15)'),
                                          onPressed: () {
                                            controller.setPage(13);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Zwischen Schönau und Sollschwitz Nr. 15'),
                                          onPressed: () {
                                            controller.setPage(15);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'In Sollschwitz Nr. 16 bis 19'),
                                          onPressed: () {
                                            controller.setPage(15);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Zwischen Sollschwitz und Saalau Lauretanische Litanei'),
                                          onPressed: () {
                                            controller.setPage(17);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child:
                                              Text('In Saalau Nr. 19 und 20'),
                                          onPressed: () {
                                            controller.setPage(20);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'In Wittichenau Nr. 19 bis 25'),
                                          onPressed: () {
                                            controller.setPage(20);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Schlussandacht am Marktkreuz'),
                                          onPressed: () {
                                            controller.setPage(25);
                                            Navigator.pop(context);
                                          },
                                        ))
                                      ]),
                                      DataRow(cells: [
                                        DataCell(TextButton(
                                          child: Text(
                                              'Lateinische Antworten in der Heiligen Messe'),
                                          onPressed: () {
                                            controller.setPage(30);
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
                        }
                      }
                    }
                    ;
                    //final page = indexPage == 0 ? pages : indexPage - 1;
                    //controller.setPage(page);
                  },
                ),
                Center(
                  child: Text("  "),
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
