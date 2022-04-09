import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    Key? key,
    required this.content,
    required this.onTextTap,
    this.leftVisible = true,
    this.rightVisible = true,
  }) : super(key: key);

  final String content;
  final bool leftVisible;
  final bool rightVisible;
  final VoidCallback? onTextTap;

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      color: Colors.orange,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.leftVisible
              ? IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: null, //TODO 열 이동은 구현하지 못했습니다.
                )
              : const SizedBox(width: 48, height: 40),

          TextButton(
            onPressed: widget.onTextTap,
            child: Text(widget.content),
          ),

          widget.rightVisible
              ? IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: null, //TODO 열 이동은 구현하지 못했습니다.
                )
              : const SizedBox(width: 48, height: 40),
        ],
      ),
    );
  }
}
