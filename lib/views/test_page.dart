import 'package:flutter/material.dart';
import 'package:newsApp/Models/ArticleModel.dart';
import 'package:newsApp/Models/catagory_model.dart';
import 'package:newsApp/helper/data.dart';
import 'package:newsApp/helper/news.dart';
import 'package:newsApp/views/home.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<CatagoryModel> menuItem = new List<CatagoryModel>();
  List<ArticleModel> article = new List<ArticleModel>();
  bool isLoading = true;
  News news = News();

  @override
  void initState() {
    super.initState();
    menuItem = getCatagories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestTitle"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
            },
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CatagoryRow(
                  imageUrl: menuItem[index].imageUrl,
                  catagoryName: menuItem[index].catagoryName,
                  country: "in",
                );
              },
              itemCount: menuItem.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Expanded(
              flex: 7,
              child: FutureBuilder(
                future: news.fetchData(),
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
              )),
        ],
      ),
    );
  }
}
