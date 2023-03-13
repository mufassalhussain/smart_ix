import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ix/utils/AppAssets.dart';
import 'package:smart_ix/utils/AppSpaces.dart';
import 'package:smart_ix/widgets/buttons.dart';
import '../business_logic/HomeScreenBloc.dart';
import 'NavigationScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  navigate(context, roomName) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NavigationController(
        roomName: roomName,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                AppSpaces.vertical10,
                Expanded(
                  child: Row(children: [
                    HomeButton(
                      image: AppAssets.livingroom,
                      text: 'Living Room',
                      isSelected: state.index == 0,
                      onTap: () {
                        navigate(context, 'Living Room');
                        BlocProvider.of<HomeScreenBloc>(context)
                            .add(SetIndexEvent(index: 0));
                      },
                    ),
                    AppSpaces.horizontal20,
                    HomeButton(
                        image: AppAssets.bedroom,
                        text: 'Bedroom',
                        isSelected: state.index == 1,
                        onTap: () {
                          BlocProvider.of<HomeScreenBloc>(context)
                              .add(SetIndexEvent(index: 1));
                          navigate(context, 'Bedroom');
                        }),
                  ]),
                ),
                AppSpaces.vertical20,
                Expanded(
                  child: Row(children: [
                    HomeButton(
                        image: AppAssets.kitchen,
                        text: 'Kitchen',
                        isSelected: state.index == 2,
                        onTap: () {
                          navigate(context, 'Kitchen');
                          BlocProvider.of<HomeScreenBloc>(context)
                              .add(SetIndexEvent(index: 2));
                        }),
                    AppSpaces.horizontal20,
                    HomeButton(
                        image: AppAssets.bathroom,
                        text: 'Bathroom',
                        isSelected: state.index == 3,
                        onTap: () {
                          BlocProvider.of<HomeScreenBloc>(context)
                              .add(SetIndexEvent(index: 3));
                          navigate(context, 'Bathroom');
                        }),
                  ]),
                ),
                AppSpaces.vertical20,
                Expanded(
                  child: Row(children: [
                    HomeButton(
                      image: AppAssets.studio,
                      text: 'Studio',
                      isSelected: state.index == 4,
                      onTap: () {
                        BlocProvider.of<HomeScreenBloc>(context)
                            .add(SetIndexEvent(index: 4));
                        navigate(context, 'Studio');
                      },
                    ),
                    AppSpaces.horizontal20,
                    HomeButton(
                        image: AppAssets.washingroom,
                        text: 'Washing Room',
                        isSelected: state.index == 5,
                        onTap: () {
                          context
                              .read<HomeScreenBloc>()
                              .add(SetIndexEvent(index: 5));
                          navigate(context, 'Washing Room');
                        }),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
