import 'package:flutter/material.dart';
import 'package:mvvm_with_map/resources/color.dart';

class RoundBtn extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundBtn(
      {Key? key,
      required this.title,
      required this.onPress,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.btncolor, borderRadius: BorderRadius.circular(10)),
        child: Center(child: loading ? CircleAvatar() : Text(title)),
      ),
    );
    // Container(
    //   height: 50,
    //   width: 250,
    //   decoration: BoxDecoration(
    //       color: AppColors.btncolor, borderRadius: BorderRadius.circular(20)),
    //   child: FlatButton(
    //     onPressed: () {

    //     },
    //     child: Text(
    //       'Login',
    //       style: TextStyle(color: AppColors.whiteColor, fontSize: 25),
    //     ),
    //   ),
    // );
  }
}
