import 'variable_app_icon_platform_interface.dart';

class VariableAppIcon {
  static String iOSDefaultAppIcon = "";
  static List<String> androidAppIconIds = [];

  static Future<String?> changeAppIcon(
      {String? iosIcon, String? androidIconId}) {
    return VariableAppIconPlatform.instance
        .changeAppIcon(iosIcon, androidIconId);
  }
}
