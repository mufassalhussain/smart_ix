import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_ix/utils/AppAssets.dart';
import 'package:smart_ix/utils/AppSpaces.dart';
import 'package:smart_ix/utils/Others.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.image,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.fontSize = 18,
    this.unSelectedImageColor,
  }) : super(key: key);
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? unSelectedImageColor;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: isSelected ? appGradient : null,
            color: !isSelected ? Get.theme.backgroundColor : null,
          ),
          child: Column(children: [
            AppSpaces.vertical15,
            Expanded(
              child: Center(
                child: Container(
                  width: Get.width / 5,
                  height: Get.height / 10,
                  child: Image.asset(
                    image,
                    color: isSelected
                        ? Colors.white
                        : (unSelectedImageColor ?? Get.theme.primaryColor),
                  ),
                ),
              ),
            ),
            AppSpaces.vertical15,
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: fontSize,
              ),
            ),
            AppSpaces.vertical15,
          ]),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: appGradient,
        ),
        padding: EdgeInsets.all(9.0),
        child: Image.asset(
          AppAssets.onOff,
          width: 25,
          height: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: appGradient,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
