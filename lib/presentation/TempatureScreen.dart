import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_ix/business_logic/TempatureBloc.dart';
import 'package:smart_ix/utils/AppAssets.dart';
import 'package:smart_ix/utils/AppSpaces.dart';
import 'package:smart_ix/widgets/buttons.dart';
import '../business_logic/BottomNavigationScreenBloc.dart';

class TempatureScreen extends StatelessWidget {
  const TempatureScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TempatureBloc, TempatureState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              AppSpaces.vertical10,
              Container(
                height: (MediaQuery.of(context).size.width - 60) / 3,
                child: Row(
                  children: [
                    HomeButton(
                      image: AppAssets.temperature,
                      isSelected: state.selectedIndex == 0,
                      text: 'Tempature',
                      onTap: () =>
                          context.read<TempatureBloc>().updateSelectedIndex(0),
                      unSelectedImageColor: Colors.black,
                      fontSize: 16,
                    ),
                    AppSpaces.horizontal10,
                    HomeButton(
                      image: AppAssets.light,
                      isSelected: state.selectedIndex == 1,
                      text: 'Lights',
                      unSelectedImageColor: Colors.black,
                      onTap: () =>
                          BlocProvider.of<BottomNavigationBloc>(context).add(2),
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
              AppSpaces.vertical10,
              Expanded(
                child: IndexedStack(
                  index: state.selectedIndex,
                  children: [
                    TempaturePage(),
                    LightPage(),
                    HumidityPage(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TempaturePage extends StatelessWidget {
  const TempaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        children: [
          Text(
            'Tempature',
            style: TextStyle(fontSize: 20),
          ),
          AppSpaces.vertical10,
          SleekCircularSlider(
            appearance: CircularSliderAppearance(
              size: 250,
              customWidths: CustomSliderWidths(progressBarWidth: 10),
              customColors: CustomSliderColors(
                  progressBarColors: [Colors.red, Colors.orange]),
              infoProperties: InfoProperties(
                bottomLabelStyle: TextStyle(fontSize: 25),
                mainLabelStyle: TextStyle(fontSize: 50),
                modifier: (double value) {
                  return '${value.toInt()}°C';
                },
              ),
            ),
            onChange: (double value) {
              context.read<TempatureBloc>().updateTempature(value.toDouble());
            },
          ),
        ],
      ),
    );
  }
}

class LightPage extends StatelessWidget {
  const LightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        children: [
          Text(
            'Lights',
            style: TextStyle(fontSize: 20),
          ),
          AppSpaces.vertical10,
          Text('Coming soon...'),
        ],
      ),
    );
  }
}

class HumidityPage extends StatelessWidget {
  const HumidityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        children: [
          Text(
            'Humidity',
            style: TextStyle(fontSize: 20),
          ),
          AppSpaces.vertical10,
          Text('Coming soon...'),
        ],
      ),
    );
  }
}
