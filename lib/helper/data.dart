import 'package:newsApp/Models/catagory_model.dart';

List<CatagoryModel> getCatagories() {
  List<CatagoryModel> catagory = new List<CatagoryModel>();
  CatagoryModel catagoryModel = new CatagoryModel();

  catagoryModel.catagoryName = "General";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  catagory.add(catagoryModel);

  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Business";
  catagoryModel.imageUrl =
      "https://images.pexels.com/photos/327540/pexels-photo-327540.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catagory.add(catagoryModel);

  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Entertainment";
  catagoryModel.imageUrl =
      "https://images.pexels.com/photos/1190298/pexels-photo-1190298.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catagory.add(catagoryModel);

  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Health";
  catagoryModel.imageUrl =
      "https://images.pexels.com/photos/461428/pexels-photo-461428.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catagory.add(catagoryModel);

  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Science";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  catagory.add(catagoryModel);

  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Sports";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  catagory.add(catagoryModel);

  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Technology";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  catagory.add(catagoryModel);

  return catagory;
}
