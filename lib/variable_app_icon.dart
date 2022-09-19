
import 'variable_app_icon_platform_interface.dart';

class VariableAppIcon {
  static Future<String?> changeAppIcon(String? name) {
    return VariableAppIconPlatform.instance.changeAppIcon(name);
  }
}
