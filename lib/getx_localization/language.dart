import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
        },
        'hi_IN': {
          'email_hint': 'ईमेल दर्ज करें',
        }
      };
}
