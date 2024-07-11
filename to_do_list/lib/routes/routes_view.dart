import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:groceryitems/src/auth/view/forgot_password_view.dart';
import 'package:groceryitems/src/auth/view/login_screen_view.dart';
import 'package:groceryitems/src/auth/view/sign_up_screen_view.dart';
import 'package:groceryitems/src/base/view/base_view.dart';
import 'package:groceryitems/src/base/view/list/view/add_list_view.dart';
import 'package:groceryitems/src/base/view/list/view/add_product_view.dart';
import 'package:groceryitems/src/base/view/list/view/catalog_items_view.dart';
import 'package:groceryitems/src/base/view/list/view/edit_list_view.dart';
import 'package:groceryitems/src/base/view/list/view/product_list_view.dart';
import 'package:groceryitems/src/base/view/profile/view/change_password_view.dart';
import 'package:groceryitems/src/base/view/profile/view/edit_profile_view.dart';
import 'package:groceryitems/src/base/view/profile/view/language_screen_view.dart';
import 'package:groceryitems/src/base/view/profile/view/profile_view.dart';
import 'package:groceryitems/src/landing/on_boarding.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: OnBoardingScreen.route, page: () => const OnBoardingScreen()),
    GetPage(name: LoginScreenView.route, page: () => const LoginScreenView()),
    GetPage(name: SignUpScreenView.route, page: () => const SignUpScreenView()),
    GetPage(
        name: ForgotPasswordView.route, page: () => const ForgotPasswordView()),
    GetPage(name: BaseView.route, page: () => const BaseView()),
    GetPage(name: ProfileView.route, page: () => const ProfileView()),
    GetPage(name: EditProfileView.route, page: () => const EditProfileView()),
    GetPage(
        name: LanguageScreenView.route, page: () => const LanguageScreenView()),
    GetPage(
        name: ChangePasswordView.route, page: () => const ChangePasswordView()),
    GetPage(name: AddListView.route, page: () => const AddListView()),
    GetPage(name: ProductListView.route, page: () => const ProductListView()),
    GetPage(
        name: AddProductListView.route, page: () => const AddProductListView()),
    GetPage(
        name: CatalogeItemsListView.route,
        page: () => const CatalogeItemsListView()),
    GetPage(name: EditListView.route, page: () => const EditListView()),
  ];
}
