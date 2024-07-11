class LocalizationMap {
  static Map<String, String> get codeEn => {
        "sign_in": "Sign in",
        "sign_up": "Sign up",
        "edit_list": "Edit List",
        "restore": "Restore",
        "welcome_to_shopifylist": "Welcome to Shopifylist",
        "the_right_way_to_make_your_shopping_easier":
            "The Right Way to Make Your Shopping Easier",
        "benefits": "Benefits",
        "popular": "Popular",
        "remove": "Remove",
        "catalogs": "Catalog",
        "save_your_time_&_energy": "Save Your Time & Energy",
        "make_shopping_smarter_avoid_extra":
            "Make shopping smarter, avoid extra",
        "trips_to_the_supermarkets_&_malls_and":
            "trips to the supermarkets & malls and",
        "get_more_organized_using_shopifylist.":
            "get more organized using Shopifylist.",
        "sign_in_to_your_account": "Sign in to Your \nAccount",
        "enter_name": "Enter Name",
        "email": "Email",
        "copy": "Copy",
        "list_empty": "List empty",
        "shared_with": "Shared With",
        "add_product": "Add Product",
        "password": "Password",
        "forgot_your_password": "Forgot your password?",
        "not_yet_a_member": "Not yet a member?",
        "please_enter_password": "Please enter password",
        "password_should_be_alphanumeric": "Password should be alphanumeric",
        "please_re_enter_your_password": "Please re enter your password",
        "password_does_not_match": "Password does not match",
        "please_enter_your_first_name": "Please Enter your name",
        "invalid_name": "Invalid Name",
        "or_connect_with": "or connect with",
        "name": "Name",
        "create_a_new_account": "Create a New Account",
        "create_an_account": "Create an account",
        "already_a_member": "Already a member?",
        "set_a_new_password": "Set a New Password",
        "password_should_contain_at_least_eight_character":
            "Password should contain at least eight character",
        "enter_email": "Enter Email",
        "please_enter_a_valid_email_address":
            "please enter a valid Email Address",
        "verify": "Verify",
        "new_password": "New password",
        "reset_password": "Reset Password",
        "settings": "Settings",
        "list": "Lists",
        "trash": "Trash",
        "required": "Required",
        "notification": "NOTIFICATIONS",
        "send_push_notification": "Send Push-notification",
        "support": "SUPPORT",
        "privacy_policy": "Privacy policy",
        "contact_support": "Contact support",
        "faq": "FAQs",
        "item_name": "Item Name",
        "send_feedback": "Send feedback",
        "copied": "Copied",
        "language": "Language",
        "general": "GENERAL",
        "back": "Back",
        "edit": "Edit",
        "add": "Add List",
        "icon": "Icon",
        "new_list": "New List",
        "color": "Color",
        "contact_us":
            "If you want to delete your account permanently, please \ncontact us: hello@companyname.com",
        "cancel": "Cancel",
        "done": "Done",
        "enter_first_name": "Enter First Name",
        "change_password": "Change Password",
        "set_a_new_passord": "SET A NEW PASSWORD",
        "old_password": "Old password",
        "add_list": "Add list",
        "no_list": "No List",
        "please_select_a_color": "Please select a color",
        "please_select_an_icon": "Please select an icon",
        "please_enter_list_title": "Please Enter List title",
        "delete": "Delete",
        "share": "Share",
        "more": "More",
        "qty": "Qty",
        "price": "Price"
      };
  static String getValues(String key) {
    return codeEn[key] ?? "";
  }
}

extension Localize on String {
  String L() {
    return LocalizationMap.getValues(this);
  }
}
