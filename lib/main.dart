import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_task/controller/product_controller.dart';
import 'package:ecommerce_task/view/product_page.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Bloc/cart_bloc/cart_bloc.dart';
import 'Bloc/cart_bloc/cart_event.dart';
import 'helper/database_helper.dart';

void main() async{
  runApp( MyApp());

      // EasyLocalization(
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('ta', 'IN'),
      // ],
      // path: 'assets/languages',
      // fallbackLocale: const Locale('en', 'US'),
      // saveLocale: true, ,)
}
mixin AppLocale {
  static const String name = 'title';
  static const String message = 'thisIs';

  static const Map<String, dynamic> EN = {
    name: "Hi Dhiraj!",
    message:"Gud Morning"
  };
  static const Map<String, dynamic> TA = {
    name: "ஹாய் திராஜ்!",
    message: "காலை வணக்கம்"
  };

}


class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  final FlutterLocalization _localization = FlutterLocalization.instance;

  //  @override
  // void initState() {
  //    _localization.init(
  //      mapLocales: [
  //        const MapLocale(
  //          'en',
  //          AppLocale.EN,
  //          countryCode: 'US',
  //          fontFamily: 'Font EN',
  //        ),
  //        const MapLocale(
  //          'km',
  //          AppLocale.TA,
  //          countryCode: 'KH',
  //          fontFamily: 'Font KM',
  //        ),
  //
  //      ],
  //      initLanguageCode: 'en',
  //    );
  //    _localization.onTranslatedLanguage = _onTranslatedLanguage;
  //    super.initState();
  //  }
  //
  //  void _onTranslatedLanguage(Locale? locale) {
  //    setState(() {});
  //  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
            create: (_) => ProductController()
        ),
        BlocProvider(
          create: (context) => CartBloc(databaseHelper: databaseHelper)..add(LoadCart()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}




