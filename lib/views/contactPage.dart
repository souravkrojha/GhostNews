import 'package:flutter/material.dart';
import 'package:newsApp/helper/my_flutter_app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "About",
            style: TextStyle(color: Colors.red[700]),
          ),
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.red[900],
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              About(),
              SizedBox(
                height: 8,
              ),
              ListTile(
                title: Text(
                  "Ghost News",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text("A news app for top headlines across the globe"),
                onTap: () {
                  launch("https://www.google.com/");
                },
              ),
              HorizontalLine(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: Text(
                  "About App",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "GitHub",
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle:
                        Text("GhostNews is open-source,check it out on GitHub"),
                    onTap: () {
                      launch("https://github.com/bughunter-99/GhostNews");
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Report Bug",
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text("Report a bug or request for new features"),
                    onTap: () {
                      launch(
                          "https://github.com/bughunter-99/GhostNews/issues");
                    },
                  )
                ],
              ),
              HorizontalLine(),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Connect",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Icon(
                    MyFlutterApp.github_circled_alt2,
                    size: 30,
                    color: Color(0xff212121),
                  ),
                ),
                title: Text(
                  "GitHub",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text("@bughunter-99"),
                onTap: () {
                  launch("https://www.github.com/bughunter-99");
                },
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Icon(
                    MyFlutterApp.linkedin,
                    size: 30,
                    color: Color(0xff0077B5),
                  ),
                ),
                title: Text(
                  "LinkedIn",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text("@SouravOjha"),
                onTap: () {
                  launch("https://www.linkedin.com/in/sourav-ojha-82ba81195/");
                },
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                    MyFlutterApp.instagram,
                    size: 25,
                    color: Colors.redAccent,
                  ),
                ),
                title: Text(
                  "Instagram",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text("@_ghost_wheel_"),
                onTap: () {
                  launch("https://www.instagram.com/_ghost_wheel_");
                },
              ),
              HorizontalLine(),
              ListTile(
                title: Text(
                  "View Licences",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: "GhostNews",
                    applicationVersion: "0.1.0",
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class HorizontalLine extends StatelessWidget {
  final Color color;
  const HorizontalLine({this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 1.0,
        width: 1000.0,
        color: color,
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Image.asset("assets/icons/icons8-news-64.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Ghost",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "News",
                style: TextStyle(color: Colors.red[700], fontSize: 25),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "0.1.0",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
