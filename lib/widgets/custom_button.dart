import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final IconData? iconData;
  final VoidCallback? onTap;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: Colors.purple,
          width: 250,
          height: 40,
          child: Center(
            child: Icon(
              widget.iconData,
            ),
          ),
        ),
      ),
    );
  }
}
