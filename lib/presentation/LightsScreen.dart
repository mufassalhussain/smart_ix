import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:smart_ix/business_logic/LightsBloc.dart';
import 'package:smart_ix/utils/AppAssets.dart';
import 'package:smart_ix/utils/AppSpaces.dart';
import 'package:smart_ix/widgets/buttons.dart';
import '../business_logic/BottomNavigationScreenBloc.dart';
import '../utils/CustomRoundedRectSlider.dart';

class LightsScreen extends StatelessWidget {
  const LightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LightsBloc, LightsState>(
      builder: (context, state) {
        if (state is LightsLoadedState) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(children: [
              AppSpaces.vertical10,
              Container(
                height: (Get.width - 60) / 3,
                child: Row(children: [
                  HomeButton(
                    image: AppAssets.temperature,
                    isSelected: state.index == 1,
                    text: 'Temperature',
                    unSelectedImageColor: Colors.black,
                    onTap: () =>
                        BlocProvider.of<BottomNavigationBloc>(context).add(0),
                    fontSize: 16,
                  ),
                  AppSpaces.horizontal10,
                  HomeButton(
                    image: AppAssets.light,
                    isSelected: state.index == 0,
                    text: 'Lights',
                    unSelectedImageColor: Colors.black,
                    onTap: () =>
                        BlocProvider.of<LightsBloc>(context).setIndex(0),
                    fontSize: 16,
                  ),
                ]),
              ),
              AppSpaces.vertical20,
              Text(
                'Intensity',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              AppSpaces.vertical10,
              Image.asset(
                AppAssets.sun,
                height: 40,
              ),
              AppSpaces.vertical10,
              Expanded(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Get.theme.primaryColor,
                      inactiveTrackColor: Get.theme.disabledColor,
                      thumbColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      thumbSelector: (textDirection, values, tapValue,
                              thumbSize, trackSize, dx) =>
                          Thumb.start,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 1,
                        elevation: 0.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 1),
                      trackHeight: Get.width / 3,
                      trackShape: CustomRoundedRectSliderTrackShape(
                          Radius.circular(12)),
                    ),
                    child: Slider(
                      onChanged: (value) => BlocProvider.of<LightsBloc>(context)
                          .setSliderData(value),
                      min: 0,
                      max: 100,
                      value: state.sliderData,
                    ),
                  ),
                ),
              ),
              AppSpaces.vertical20,
              FlutterSwitch(
                value: state.switchData,
                onToggle: (value) =>
                    BlocProvider.of<LightsBloc>(context).setSwitchData(value),
                inactiveColor: Get.theme.disabledColor,
                activeColor: Get.theme.disabledColor,
                padding: 0.0,
                toggleColor: Get.theme.primaryColor,
                toggleSize: 30.0,
                height: 30,
              ),
              AppSpaces.vertical20,
            ]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
