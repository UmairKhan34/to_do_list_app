import 'package:flutter/material.dart';
import 'package:groceryitems/src/base/view/list/model/list_model.dart';
import 'package:groceryitems/src/base/view/trash/model/trash_model.dart';

import '../../list/view_model/list_vm.dart';

class TrashVM extends ChangeNotifier {
  List<TrashModel> trashList = [];

  void deletedList(ListModel deletedList) {
    trashList.add(TrashModel(
      title: deletedList.title,
      color: deletedList.color,
      icon: deletedList.icon,
    ));
    update();
  }

  void restoreFromTrash(int index, ListVM listVm) {
    if (index >= 0 && index < trashList.length) {
      listVm.addListItems(
        trashList[index].title,
        trashList[index].color,
        trashList[index].icon,
      );
      trashList.removeAt(index);
      update();
    }
  }

  void update() {
    notifyListeners();
  }
}
