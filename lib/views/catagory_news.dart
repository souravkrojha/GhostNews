// import 'package:flutter/material.dart';
// import 'package:newsApp/helper/news.dart';
// import 'package:newsApp/views/home.dart';

// class CatagoryNews extends StatefulWidget {
//   final String catagory, country;
//   CatagoryNews({this.catagory, this.country});
//   @override
//   _CatagoryNewsState createState() => _CatagoryNewsState();
//   fetchData(String catagory) {}
// }

// class _CatagoryNewsState extends State<CatagoryNews> {
//   // CatagoryNewss news = CatagoryNewss();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("Ghost"),
//             Text(
//               "News",
//               style: TextStyle(color: Colors.red[700]),
//             ),
//           ],
//         ),
//         elevation: 0,
//         actions: <Widget>[
//           Opacity(
//               opacity: 0,
//               child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Icon(Icons.ac_unit)))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           padding: EdgeInsets.only(top: 20),
//           height: 1000,
//           child: FutureBuilder(
//             future: news.fetchData(
//               widget.catagory,
//               country: widget.country,
//             ),
//             builder: (context, snapshot) {
//               if (snapshot.data == null) {
//                 return Center();
//               } else {
//                 return ListView.builder(
//                   // scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context, index) {
//                     // return Text(snapshot.data[index].description);
//                     return NewsTile(
//                         imageUrl: snapshot.data[index].urlToImage,
//                         title: snapshot.data[index].title,
//                         description: snapshot.data[index].description,
//                         url: snapshot.data[index].url);
//                   },
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
