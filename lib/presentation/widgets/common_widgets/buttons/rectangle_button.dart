import 'package:flutter/material.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';
import 'package:info_profile/presentation/utils/app_styles.dart';

class RectangleButton extends StatelessWidget {
// ******************** VARIABLES *********************
  final double height;
  final double width;

  final String btnName;
  final Icon? btnIcon;
  final bool? loading;
  final Color? btnColor;
  final TextStyle? btnStyle;
  final VoidCallback btnCallBack;
// ******************** RECTANGLE BUTTON CONSTRUCTOR *********************
  const RectangleButton({
    Key? key,
    required this.btnName,
    this.btnIcon,
    this.btnColor,
    this.btnStyle,
    required this.btnCallBack,
    this.loading = false,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          btnCallBack();
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: loading!
                ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: AppColor.white,
                    ),
                  )
                : btnIcon != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          btnIcon!,
                          Text(
                            btnName,
                            style: AppStyle.whiteButtonStyle,
                          )
                        ],
                      )
                    : Text(
                        btnName,
                        style: AppStyle.whiteButtonStyle,
                      ),
          ),
        ),
      ),
    );
  }
}
