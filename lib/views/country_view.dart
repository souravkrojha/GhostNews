import 'package:flutter/material.dart';
import 'package:newsApp/Models/catagory_model.dart';
// import 'package:newsApp/Models/country_model.dart';
// import 'package:newsApp/helper/CountryData.dart';
import 'package:newsApp/helper/data.dart';
import 'package:newsApp/helper/news.dart';
import 'package:newsApp/views/home.dart';

class CountryView extends StatefulWidget {
  final String country;
  CountryView({this.country});
  @override
  _CountryViewState createState() => _CountryViewState();
  fetchData(String country) {}
}

class _CountryViewState extends State<CountryView> {
  List<CatagoryModel> catagory = new List<CatagoryModel>();
  // CatagoryNewss newss = CatagoryNewss();

  String catagoryS = '';
  News news = News();
  @override
  void initState() {
    super.initState();
    catagory = getCatagories();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Ghost"),
            Text(
              "News",
              style: TextStyle(color: Colors.red[700]),
            ),
          ],
        ),
        elevation: 0,
        actions: <Widget>[
          Opacity(
              opacity: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.ac_unit)))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                child: ListView.builder(
                    itemCount: catagory.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CatagoryRow(
                        imageUrl: catagory[index].imageUrl,
                        catagoryName: catagory[index].catagoryName,
                        country: widget.country,
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  height: 600,
                  child: FutureBuilder(
                    future: news.fetchData(catagory: catagoryS),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Center();
                      } else {
                        return ListView.builder(
                          // scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: snapshot.data.length + 1,
                          itemBuilder: (context, index) {
                            // return Text(snapshot.data[index].description);
                            if (index == snapshot.data.length) {
                              return SizedBox(
                                child: Text("No more data."),
                                height: 100,
                              );
                            }
                            return NewsTile(
                                imageUrl: snapshot.data[index].urlToImage,
                                title: snapshot.data[index].title,
                                description: snapshot.data[index].description,
                                url: snapshot.data[index].url);
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
