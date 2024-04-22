import 'package:e_commerce/models/categories_model.dart';
import 'package:e_commerce/services/assets_manager.dart';

class AppConstans {
  //resimlerin çekileceği yer
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> bannerImages = [
    'images/banner/1.png',
    'images/banner/2.png',
    'images/banner/3.png',
    'images/banner/4.png',
    'images/banner/5.png',
    'images/banner/6.png',
    'images/banner/7.png'
  ];
  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
        id: "Computer",
        name: "Computer",
        image: 'images/categories/computer.png'),
    CategoriesModel(
        id: "Books", name: "Books", image: 'images/categories/file.png'),
    CategoriesModel(
        id: "Flower", name: "Flower", image: 'images/categories/flower.png'),
    CategoriesModel(
        id: "Mobile Phone",
        name: "Mobile Phone",
        image: 'images/categories/mobilephone.png'),
    CategoriesModel(
        id: "Shoes", name: "Shoes", image: 'images/categories/shoes3.png'),
    CategoriesModel(
        id: "T-short", name: "T-short", image: 'images/categories/tshort.png'),
    CategoriesModel(
        id: "Watch", name: "Watch", image: 'images/categories/watch.png'),
  ];
}
