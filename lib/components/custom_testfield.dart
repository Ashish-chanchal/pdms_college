import 'package:flutter/material.dart';
import 'package:pdms/consts/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textcontroller;
  final Color? textColor;
  final Color borderColor;
  final Color inputColor;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.textcontroller,
      this.textColor = Colors.black,
      this.borderColor = Colors.black,
      this.inputColor = Colors.black});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textcontroller,
      cursorColor: AppColors.textColor,
      style: TextStyle(color: widget.inputColor),
      decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.textColor)),
    );
  }
}
