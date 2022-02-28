import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salaty/providers/quran_provider.dart';
import 'package:salaty/screens/quran.dart';

class SurasIndex extends StatefulWidget {
  static const String id = 'suras_index';
  @override
  _SurasIndexState createState() => _SurasIndexState();
}

class _SurasIndexState extends State<SurasIndex> {
  @override
  // List<Sura> _searched = [];
  Widget build(BuildContext context) {
    final surasIndexData = Provider.of<SurasProvider>(context, listen: false);
    return Scaffold(
        body: Container(
      child: SafeArea(
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Opacity(
                          opacity: .7,
                          child: Image.asset('assets/images/logo.jpg',
                              fit: BoxFit.fill)),
                    ),
                    Text(
                      'فهرس سور القران الكريم',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(5, 5),
                                blurRadius: 1)
                          ]),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 3,
                  child: FutureBuilder(
                      future: surasIndexData.fetchAndSetSuras(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Text('An error occured, try again later');
                        }
                        return ListView.builder(
                            itemCount: surasIndexData.suras.length,
                            itemBuilder: (context, index) {
                              return SuraTile(
                                  surasIndexData.suras[index].id!,
                                  surasIndexData.suras[index].suraName!,
                                  surasIndexData.suras[index].place!,
                                  surasIndexData.suras[index].noOfAyas!);
                            });
                      })),
            ],
          ),
        ),
      ),
    ));
  }
}

class SuraTile extends StatefulWidget {
  final int index;
  final String suraName;
  final int noOfAyas;
  final String suraLocation;
  SuraTile(this.index, this.suraName, this.suraLocation, this.noOfAyas);
  @override
  _SuraTileState createState() => _SuraTileState();
}

class _SuraTileState extends State<SuraTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, QuranScreen.id, arguments: widget.index);
        },
        title: Text(
          widget.suraName,
          textAlign: TextAlign.right,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.noOfAyas.toString() + ' وعدد اياتها   ',
              textAlign: TextAlign.right,
            ),
            widget.suraLocation == 'Meccan'
                ? Text(
                    'مكيــة',
                    textAlign: TextAlign.right,
                  )
                : Text(
                    'مدنيـــة',
                    textAlign: TextAlign.right,
                  )
          ],
        ),
        trailing: CircleAvatar(child: Text(widget.index.toString())),
      ),
    );
  }
}

//  SliverFillRemaining(
//               child: FutureBuilder(
//                 future: surasIndexData.fetchAndSetSuras(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   }
//                   if (snapshot.hasError) {
//                     Text('Error occured from our side');
//                   }
//                   return ListView.builder(
//                       itemCount: surasIndexData.suras.length,
//                       itemBuilder: (context, index) {
//                         return Text(surasIndexData.suras[index].suraName);
//                       });
//                 },
//               ),
//             ),