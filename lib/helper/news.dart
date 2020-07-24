import 'dart:convert';
import 'package:newsApp/Models/ArticleModel.dart';
import 'package:requests/requests.dart';

class News {
  // String country;
  // News({this.country = 'in'});
  Future<List<ArticleModel>> fetchData(
      {String catagory = '', String country = 'in'}) async {
    List<ArticleModel> news = [];
    String url = "https://newsapi.org/v2/top-headlines?";

    url += "country=$country";

    if (catagory.isNotEmpty) {
      url += "&category=$catagory";
    }

    url += "&apiKey=cbe258c6b409474587856bc29234983a";
    var response = await Requests.get(url);
    var jsonData = jsonDecode(response.content());

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            author: element["author"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
            publishedAt: element["publishedAt"],
          );

          news.add(articleModel);
        }
      });
    }

    return news;
  }
}
