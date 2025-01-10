import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.iconData,
    required this.onPressed,
    this.outlinedColor,
    this.backgroundColor,
    this.foregroundColor,
  });
  final String text;
  final IconData? iconData;
  final VoidCallback onPressed;
  final Color? outlinedColor;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 56.0,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(color: outlinedColor ?? const Color(0xFF707070)),
      ),
      child: Row(
        children: <Widget>[
          if (iconData != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 6.0),
              child: Icon(
                iconData,
                color: foregroundColor ?? Colors.grey.shade700,
              ),
            ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: foregroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.text,
    this.iconData,
    required this.onPressed,
    // this.backgroundColor,
  });
  final String text;
  final IconData? iconData;
  final VoidCallback onPressed;
  // final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: const BorderSide(color: Color(0xFF707070)),
      ),
      child: Row(
        children: <Widget>[
          if (iconData != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Icon(iconData, color: Colors.grey.shade700),
            ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
