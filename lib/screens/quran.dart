import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaty/providers/quran_provider.dart';

class QuranScreen extends StatefulWidget {
  static const String id = 'quran_screen';

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  // var _isInit = true;
  // var _isLoading = false;
  // @override
  // void didChangeDependencies() async {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await Provider.of<QuranProvider>(context).fetchAndSetData(110);
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final suraNo = ModalRoute.of(context)!.settings.arguments as int;
    print(suraNo);
    final qurandata = Provider.of<QuranProvider>(context, listen: false);
    return Scaffold(
        body: Container(
            child: SafeArea(
      child: FutureBuilder(
        future: qurandata.fetchAndSetData(suraNo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text('Error... Try again Later');
          }
          return Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: width,
                child: Image(image: AssetImage('assets/images/bordertop.png')),
              ),
              Positioned(
                top: 100,
                right: 20,
                left: 20,
                child: Container(
                  height: height - 200,
                  child: ListView.builder(
                      itemCount: qurandata.quran.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          // color: Colors.teal,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: qurandata.quran[0].suraName! + '\n',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                                children: [
                                  for (var string in qurandata.quran[0].ayas!)
                                    TextSpan(
                                        text: string.ayaText +
                                            '  ' +
                                            string.ayaNo.toString()),
                                ]),
                          ),
                        );
                      }),
                ),
              ),
            ],
          );
        },
      ),
    )));
  }
}


//  child: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           :
          // : ListView.builder(
          //     itemCount: quranData.length,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          // Text(quranData[index].suraName),
          // Expanded(
          //     child: ListView(children: [
          //     Center(
          //       child: RichText(
          //           textAlign: TextAlign.center,
          //           text: TextSpan(children: <InlineSpan>[
          //             TextSpan(text: quranData[0].suraName + '\n', children: [
          //               for (var string in quranData[0].ayasText)
          //                 TextSpan(
          //                     text: string + ' 🧡 ',
          //                     style: TextStyle(color: Colors.black)),
          //             ]),
          //           ])
                    // ListView.builder(
                    //   itemCount: list.length,
                    //   // quranData[0].ayasText.length,
                    //   itemBuilder: (context, idx) {
                    //     return
                    //  RichText(
                    //   text: TextSpan(text: 'hjjh', children: <InlineSpan>[
                    //     TextSpan(
                    //       text: quranData[0].ayasText[idx],
                    //       style: TextStyle(color: Colors.black),
                    //     ),
                    //   ]),
                    // );

                    // Container(
                    //   child: Text.rich(TextSpan(children: <InlineSpan>[
                    //     TextSpan(
                    //       text: quranData[1].ayasText[idx],
                    //     ),
                    //     WidgetSpan(child: Icon(Icons.favorite)),
                    //   ])),
                    // );

                    // Container(
                    //   child: Text(
                    //     quranData[100].ayasText[idx],
                    //   ),
                    // );
                    // },
                    //   ),
                    // ),
                    //     ],
                    //   );
                    // })),
    //                 ),
    //           ),
    //         ])),
    // )
    // 
    // 
    // 
    // FutureBuilder(
        //   future: qurandata.fetchAndSetData(114),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     if (snapshot.hasError) {
        //       return Text('Error... Try again Later');
        //     }
        //     return ListView.builder(
        //         itemCount: qurandata.quran.length,
        //         itemBuilder: (context, index) {
        //           return RichText(
        //             text: TextSpan(
        //                 text: qurandata.quran[0].suraName + '\n',
        //                 children: [
        //                   for (var string in qurandata.quran[0].ayas)
        //                     TextSpan(
        //                         text: string.ayaText + string.ayaNo.toString()),
        //                 ]),
        //           );
        //         });
        //   },
        // ),