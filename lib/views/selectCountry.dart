import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsApp/helper/CountryData.dart';
import "package:newsApp/Models/country_model.dart";

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<CountryModel> country = new List<CountryModel>();
  @override
  void initState() {
    super.initState();
    country = getCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
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
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.red[900],
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.share,
                  )),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 16),,
              height: 600,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: country.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: CountryRow(
                        countryName: country[index].countryName,
                        countryLogo: country[index].countryLogo,
                        countryCode: country[index].countryCode,
                      ),
                      onTap: () {
                        Navigator.pop(context, country[index].countryCode);
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryRow extends StatelessWidget {
  final String countryName, countryLogo, countryCode;
  CountryRow({this.countryName, this.countryLogo, this.countryCode});
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: countryLogo,
              width: 400,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black12,
            ),
            width: 400,
            height: 150,
            child: Text(
              countryName,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
