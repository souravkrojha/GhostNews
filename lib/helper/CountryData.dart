import 'package:newsApp/Models/country_model.dart';

List<CountryModel> getCountry() {
  List<CountryModel> country = new List<CountryModel>();
  CountryModel countryModel = new CountryModel();

  countryModel.countryName = "India";
  countryModel.countryLogo =
      "https://cdn.pixabay.com/photo/2020/04/14/10/15/flag-of-india-5041783_960_720.jpg";
  countryModel.countryCode = "in";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "United States";
  countryModel.countryLogo =
      "https://images.pexels.com/photos/4386429/pexels-photo-4386429.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  countryModel.countryCode = "us";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Russia";
  countryModel.countryLogo =
      "https://static4.depositphotos.com/1007011/319/i/450/depositphotos_3195223-stock-photo-flag-of-russia.jpg";
  countryModel.countryCode = "ru";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Germany";
  countryModel.countryLogo =
      "https://cdn.pixabay.com/photo/2015/11/24/16/23/flag-germany-1060305__340.jpg";
  countryModel.countryCode = "de";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "France";
  countryModel.countryLogo =
      "https://i.ytimg.com/vi/IqTOQU5TAII/maxresdefault.jpg";
  countryModel.countryCode = "fr";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Canada";
  countryModel.countryLogo =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/255px-Flag_of_Canada_%28Pantone%29.svg.png";
  countryModel.countryCode = "ca";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "United Kingdom";
  countryModel.countryLogo =
      "https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/1200px-Flag_of_the_United_Kingdom.svg.png";
  countryModel.countryCode = "gb";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "New zealand";
  countryModel.countryLogo =
      "https://assets.change.org/photos/6/kz/qj/EMkZQjSuEUxoDst-800x450-noPad.jpg?1522271476";
  countryModel.countryCode = "nz";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Italy";
  countryModel.countryLogo =
      "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/1200px-Flag_of_Italy.svg.png";
  countryModel.countryCode = "it";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Spain";
  countryModel.countryLogo =
      "https://srcnaut.com/cdn-cgi/image/f=auto,fit=crop,g=0.5x0.5,w=2000,h=1125,q=90,d=1/upload/23/08/01/shutterstock-104644850.jpg";
  countryModel.countryCode = "es";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Israel";
  countryModel.countryLogo =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Flag_of_Israel.svg/1200px-Flag_of_Israel.svg.png";
  countryModel.countryCode = "il";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "South Korea";
  countryModel.countryLogo =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/640px-Flag_of_South_Korea.svg.png";
  countryModel.countryCode = "kr";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Japan";
  countryModel.countryLogo =
      "https://www.world-grain.com/ext/resources/Article-Images/2020/04/Japan_AdobeStock_62195416_E.jpg?1586450703";
  countryModel.countryCode = "jp";
  country.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "South Africa";
  countryModel.countryLogo =
      "https://buzzsouthafrica.com/wp-content/uploads/South-African-Flag.jpg";
  countryModel.countryCode = "za";
  country.add(countryModel);
  return country;
}
