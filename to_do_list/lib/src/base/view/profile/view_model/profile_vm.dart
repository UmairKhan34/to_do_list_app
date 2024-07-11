import 'package:flutter/material.dart';
import 'package:groceryitems/src/base/view/profile/model/profile_model.dart';

class ProfileVM extends ChangeNotifier {
  LanguageModel model = LanguageModel();
  List<LanguageModel> languageList = [
    LanguageModel(languageName: 'English (US)', englishLanguage: 'English'),
    LanguageModel(languageName: 'Afrikaans', englishLanguage: 'Afrikaans'),
    LanguageModel(
        languageName: 'Bahasa Indonesia', englishLanguage: 'Indonesian'),
    LanguageModel(languageName: 'Bahasa Melayu', englishLanguage: 'Malay'),
    LanguageModel(languageName: 'Dansk', englishLanguage: 'Danish'),
    LanguageModel(languageName: 'Deutsch', englishLanguage: 'German'),
    LanguageModel(languageName: 'English (UK)', englishLanguage: 'English'),
    LanguageModel(languageName: 'Español (España)', englishLanguage: 'Spanish'),
    LanguageModel(
        languageName: 'Español (América Latino)', englishLanguage: 'Spanish'),
    LanguageModel(languageName: 'Filipino', englishLanguage: 'Filipinos'),
    LanguageModel(languageName: 'Français (Canada)', englishLanguage: 'French'),
    LanguageModel(languageName: 'Urdu', englishLanguage: 'urdu'),
  ];
}
