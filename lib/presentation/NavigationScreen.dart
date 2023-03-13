import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart_ix/presentation/LightsScreen.dart';
import 'package:smart_ix/presentation/TempatureScreen.dart';

import '../business_logic/BottomNavigationScreenBloc.dart';

class NavigationController extends StatelessWidget {
  final roomName;
  const NavigationController({Key? key, required this.roomName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, int>(
      builder: (context, index) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            backgroundColor: Get.theme.colorScheme.secondary,
            title: Text(
              roomName,
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: index == 0 ? TempatureScreen() : LightsScreen(),
        );
      },
    );
  }
}
