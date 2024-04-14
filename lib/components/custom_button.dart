
import 'package:pdms/consts/consts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttontext;
  final double widt;
  const CustomButton(
      {super.key, required this.onTap, required this.buttontext, this.widt = 150});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widt,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(
                side: BorderSide(color: AppColors.primaryColor, width: 1.0),
              ),
              backgroundColor: AppColors.whiteColor,
            ),
            onPressed: onTap,
            child: buttontext.text.make()));
  }
}
