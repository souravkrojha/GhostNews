import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsApp/Models/ArticleModel.dart';
import 'package:newsApp/Models/catagory_model.dart';
import 'package:newsApp/Models/country_model.dart';
import 'package:newsApp/helper/data.dart';
import 'package:flutter/widgets.dart';
import 'package:newsApp/helper/my_flutter_app_icons.dart';
import 'package:newsApp/helper/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsApp/views/article_view.dart';
import 'package:newsApp/views/contactPage.dart';
import 'package:newsApp/views/selectCountry.dart';

class Home extends StatefulWidget {
  // String country;
  // Home({this.country});
  @override
  _HomeState createState() => _HomeState();
  fetchData() {}
}

class _HomeState extends State<Home> {
  List<CatagoryModel> catagory = new List<CatagoryModel>();
  List<ArticleModel> article = new List<ArticleModel>();
  List<CountryModel> country = new List<CountryModel>();
  bool isLoading = false;
  String catagoryS = '';
  String countryS = 'in';
  News news = News();

  void setCountry(String newCountry) {
    setState(() {
      countryS = newCountry;
    });
  }

  void makePageLoadTrue() {
    setState(() {
      isLoading = true;
    });
  }

  void makePageLoadFalse() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    catagory = getCatagories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.fiber_new),
        //     onPressed: () {},
        //   )
        // ],
        elevation: 0,
      ),
      // backgroundColor: Colors.white,
      body: Container(
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
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          catagoryS = catagory[index].catagoryName;
                        });
                      },
                      child: CatagoryRow(
                        imageUrl: catagory[index].imageUrl,
                        catagoryName: catagory[index].catagoryName,
                        country: countryS,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "$catagoryS Headlines",
                    style: TextStyle(color: Colors.green[400], fontSize: 20),
                  ),
                  Text(
                    "Country: $countryS",
                    style: TextStyle(color: Colors.green[400], fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: FutureBuilder(
                  future:
                      news.fetchData(catagory: catagoryS, country: countryS),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                          child: SpinKitFadingCube(
                        color: Color(0xff212121),
                      ));
                    } else {
                      // makePageLoadFalse();
                      return ListView.builder(
                        // scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.length + 1,
                        itemBuilder: (context, index) {
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
      floatingActionButton: FabCircularMenu(
        animationDuration: Duration(milliseconds: 600),
        animationCurve: Curves.easeInCubic,
        fabOpenIcon: Icon(
          Icons.short_text,
          color: Colors.white,
        ),
        fabColor: Colors.red[700],
        fabCloseIcon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        ringColor: Color(0x0ff001C),
        ringDiameter: 200,
        fabSize: 50,
        ringWidth: 60,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.red[500],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactPage()));
                }),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: IconButton(
                icon: Icon(
                  MyFlutterApp.globe,
                  color: Colors.red[900],
                ),
                onPressed: () {
                  // makePageLoadTrue();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectCountry(),
                    ),
                  ).then((value) {
                    if (value != null) setCountry(value);
                  });
                  // makePageLoadFalse();
                }),
          ),
        ],
      ),
    );
    //  FloatingActionButton(
    //     backgroundColor: Colors.red[700],
    //     child: Icon(Icons.settings),
    //     mini: true,
    //     onPressed: () {
    //       settingModalBottomSheet(context, setCountry);
    //     },
    //   ),
    // );
  }
}

class CatagoryRow extends StatelessWidget {
  final String imageUrl, catagoryName, country;
  CatagoryRow({this.imageUrl, this.catagoryName, this.country});
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.only(left: 16),
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black38,
            ),
            width: 120,
            height: 60,
            child: Text(
              catagoryName,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  NewsTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Article(
              newsUrl: url,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  // color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4,
            ),
            Text(description,
                style: TextStyle(fontSize: 14, color: Colors.grey))
          ],
        ),
      ),
    );
  }
}
