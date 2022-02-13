import 'dart:io';

class AdHelper {
  static String get bannerUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5759134354866621/2781930646';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5759134354866621/2781930646';
    } else {
      return 'ca-app-pub-5759134354866621/2781930646';
    }
  }
}
