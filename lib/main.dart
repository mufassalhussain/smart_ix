import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_ix/presentation/HomeScreen.dart';
import 'business_logic/BottomNavigationScreenBloc.dart';
import 'business_logic/HomeScreenBloc.dart';
import 'business_logic/LightsBloc.dart';
import 'business_logic/TempatureBloc.dart';
import 'controllers/HomeScreenController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController _controller = HomeScreenController();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => BottomNavigationBloc(),
          ),
          BlocProvider(
            create: (context) => HomeScreenBloc(controller: _controller),
          ),
          BlocProvider<TempatureBloc>(
            create: (context) => TempatureBloc(),
          ),
          BlocProvider<LightsBloc>(
            create: (context) => LightsBloc(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart IX',
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            primaryColor: Color(0xff2596be),
            backgroundColor: Color(0xfff0f0f0),
            disabledColor: Color(0xffededed),
            colorScheme: ColorScheme.fromSwatch(accentColor: Color(0xff2596be)),
            textTheme: GoogleFonts.openSansTextTheme(),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const HomeScreen(),
        ));
  }
}
