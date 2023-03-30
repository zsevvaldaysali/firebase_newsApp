import 'dart:io';

enum PlatformEnums {
  android,
  ios;

  static String get versionName {
    if (Platform.isIOS) {
      return PlatformEnums.ios.name;
    }
    if (Platform.isAndroid) {
      return PlatformEnums.android.name;
    }

    throw Exception('Platform unused, please check!');
  }
}
