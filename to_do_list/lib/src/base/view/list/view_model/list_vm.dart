import 'package:flutter/material.dart';
import 'package:groceryitems/constants/enum.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/base/view/list/model/list_model.dart';
import 'package:groceryitems/src/base/view/trash/view_model/trash_vm.dart';

class ListVM extends ChangeNotifier {
  List<ListModel> listModel = [];
  List<Cataloge> showCatalogeList = [];
  List<Cataloge> popularModel = [
    Cataloge(catalogeItemList: [
      CatalogeItems(id: 1, name: 'Sock', isPopular: false, isSelected: false),
      CatalogeItems(id: 2, name: 'Mobile', isPopular: false, isSelected: false),
      CatalogeItems(id: 3, name: 'Bag', isPopular: false, isSelected: false),
    ], name: 'Accessories', image: R.images.bag),
    Cataloge(catalogeItemList: [
      CatalogeItems(id: 4, name: 'Wine', isPopular: false, isSelected: false),
    ], name: 'Alcoholic Drinks', image: R.images.bucket),
    Cataloge(catalogeItemList: [
      CatalogeItems(id: 5, name: 'cloths', isPopular: false, isSelected: false),
    ], name: 'Baby Goods', image: R.images.teddy),
    Cataloge(catalogeItemList: [
      CatalogeItems(
          id: 6, name: 'Still Water', isPopular: true, isSelected: false),
    ], name: 'Beverages (non-alcoholic)', image: R.images.beverages),
    Cataloge(catalogeItemList: [
      CatalogeItems(
          id: 7, name: 'Biscuit', isPopular: false, isSelected: false),
    ], name: 'Bakery', image: R.images.cake),
    Cataloge(catalogeItemList: [
      CatalogeItems(
          id: 8, name: 'Biscuit', isPopular: false, isSelected: false),
    ], name: 'Canned Goods', image: R.images.tomato),
    Cataloge(catalogeItemList: [
      CatalogeItems(id: 9, name: 'Soap', isPopular: false, isSelected: false),
    ], name: 'Cleaners', image: R.images.cleaner),
    Cataloge(catalogeItemList: [
      CatalogeItems(id: 10, name: 'Jeans', isPopular: true, isSelected: false),
      CatalogeItems(
          id: 11, name: 'Sneakers', isPopular: true, isSelected: false),
    ], name: 'Clothes & Shoes', image: R.images.cloth),
    Cataloge(catalogeItemList: [
      CatalogeItems(
          id: 12, name: 'CHUBBY', isPopular: false, isSelected: false),
      CatalogeItems(
          id: 13, name: 'Canada Try', isPopular: false, isSelected: false),
      CatalogeItems(
          id: 14, name: 'Coca-Cola', isPopular: true, isSelected: false),
      CatalogeItems(
          id: 15, name: 'coffee Beans', isPopular: false, isSelected: false),
      CatalogeItems(
          id: 16, name: 'Cott Beverages', isPopular: false, isSelected: false),
    ], name: 'Coffee, Tea & Cocoa', image: R.images.cup),
    Cataloge(catalogeItemList: [
      CatalogeItems(id: 17, name: 'Milk', isPopular: false, isSelected: false),
    ], name: 'Dairy', image: R.images.ingredients),
    Cataloge(catalogeItemList: [
      CatalogeItems(
          id: 18, name: 'DRY SODA', isPopular: false, isSelected: false),
      CatalogeItems(
          id: 19, name: 'DRY ENUF', isPopular: false, isSelected: false),
      CatalogeItems(id: 20, name: 'Dads', isPopular: false, isSelected: false),
      CatalogeItems(id: 21, name: 'Doc', isPopular: false, isSelected: false),
    ], name: 'Dry Goods', image: R.images.almond),
    Cataloge(catalogeItemList: [
      CatalogeItems(id: 22, name: 'Apples', isPopular: true, isSelected: false),
      CatalogeItems(
          id: 23, name: 'Avocado', isPopular: true, isSelected: false),
    ], name: 'Fruits', image: R.images.friut),
    Cataloge(catalogeItemList: [
      CatalogeItems(id: 24, name: 'Carrot', isPopular: true, isSelected: false),
      CatalogeItems(
          id: 25, name: 'Spinach (fresh)', isPopular: true, isSelected: false),
    ], name: 'Vegetables', image: R.images.friut),
    Cataloge(catalogeItemList: [
      CatalogeItems(
          id: 26, name: 'Micellar Water', isPopular: true, isSelected: false),
      CatalogeItems(
          id: 27, name: 'Shampoo', isPopular: true, isSelected: false),
    ], name: 'Personal Care & Beauty', image: R.images.bag),
    Cataloge(catalogeItemList: [
      CatalogeItems(
          id: 28, name: 'Aspirin', isPopular: true, isSelected: false),
    ], name: 'Pharmacy', image: R.images.ingredients),
  ];
  void addCatalogeList(String title, String subtitle) {
    int index = showCatalogeList.indexWhere((element) => element.name == title);
    if (index != -1) {
      showCatalogeList[index]
          .catalogeItemList
          ?.add(CatalogeItems(name: subtitle));
    } else {
      showCatalogeList.add(Cataloge(
        name: title,
        catalogeItemList: [CatalogeItems(name: subtitle)],
      ));
    }
  }

  void addListItems(String? title, ColorChoice? color, IconChoice? icon) {
    listModel.add(ListModel(title: title, color: color, icon: icon));
    update();
  }

  void moveTrashScreen(int index, TrashVM trashVm) {
    if (index >= 0 && index < listModel.length) {
      trashVm.deletedList(listModel[index]);
      listModel.removeAt(index);
      update();
    }
  }

  void removeCataloge(Cataloge model) {
    showCatalogeList.remove(model);
    update();
  }

  void update() {
    notifyListeners();
  }
}
