import 'package:image_picker/image_picker.dart';

class UserModel {
  String? name;
  String? email;
  XFile? image;
  String? lastName;
  UserModel({this.name, this.email, this.image, this.lastName});
}
