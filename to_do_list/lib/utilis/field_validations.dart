import 'package:groceryitems/resources/app_localization.dart';

class FieldValidator {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues('enter_email');
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return LocalizationMap.getValues('please_enter_a_valid_email_address');
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues("please_enter_password");
    }
    if (value.length < 8) {
      return LocalizationMap.getValues(
          "password_should_contain_at_least_eight_character");
    }
    if (!RegExp(r"^(?=.*[A-Za-z@#$])(?=.*\d).{8,}$").hasMatch(value)) {
      return LocalizationMap.getValues("password_should_be_alphanumeric");
    }
    return null;
  }

  static String? validateStartDate(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues("please_select_start_date");
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues("please_select_date");
    }
    return null;
  }

  static String? validatePasswordMatch(String? value, String? pass2) {
    if (pass2!.isEmpty) {
      return LocalizationMap.getValues("please_re_enter_your_password");
    }
    if (value != pass2) {
      return LocalizationMap.getValues("password_does_not_match");
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues("please_enter_your_first_name");
    }
    if (value.length <= 2) {
      return LocalizationMap.getValues("invalid_name");
    } else if (!RegExp(r'^[^\s]').hasMatch(value)) {
      return LocalizationMap.getValues("invalid_name");
    }
    if (!RegExp(r"^([ \u00c0-\u01ffa-zA-Z'\-])+$").hasMatch(value)) {
      return LocalizationMap.getValues("invalid_name");
    }
    return null;
  }

  static String? validateEmptyField(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues("field_can't_be_empty");
    }
    return null;
  }

  static String? location(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues("please_enter_location");
    }

    return null;
  }
}
