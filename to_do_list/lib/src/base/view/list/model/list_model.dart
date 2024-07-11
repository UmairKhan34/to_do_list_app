import 'package:groceryitems/constants/enum.dart';

class ListModel {
  String? title;
  ColorChoice? color;
  IconChoice? icon;

  ListModel({this.title, this.color, this.icon});
}

class Cataloge {
  String? image;
  String? name;
  int? id;
  List<CatalogeItems>? catalogeItemList;

  Cataloge({this.name, this.catalogeItemList, this.image, this.id});
}

class CatalogeItems {
  String? name;
  int? id;
  bool? isPopular;
  bool? isSelected;
  int? quantity;
  double? price;

  CatalogeItems({
    this.name,
    this.isPopular,
    this.isSelected = false,
    this.id,
    this.quantity = 0,
    this.price = 0.0,
  });
}
