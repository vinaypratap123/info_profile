import 'package:fluttertoast/fluttertoast.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';

class UiHelper {
  static void toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: AppColor.primaryColor,
        textColor: AppColor.white,
        fontSize: 16);
  }
}
