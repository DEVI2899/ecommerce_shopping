import 'package:ecommerce_task/l10n/l10n.dart';
import 'package:ecommerce_task/provider/locale_provider.dart';
import 'package:ecommerce_task/view/profile_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_task/controller/product_controller.dart';
import 'package:ecommerce_task/view/product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Bloc/cart_bloc/cart_bloc.dart';
import 'Bloc/cart_bloc/cart_event.dart';
import 'helper/database_helper.dart';

void main() {
  runApp(const MyApp());

}



class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

 // Locale _locale = const Locale('ta');





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
        ChangeNotifierProvider(create:(_) =>LocaleProvider(),
        builder: (context, state) {
          final provider = Provider.of<LocaleProvider>(context);
          return  MaterialApp(
              title: 'Flutter Demo',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: L10n.all,
              locale:provider.locale ,

              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),

              routes: {
                '/': (context) => const ProductPage(),
              },

              debugShowCheckedModeBanner: false

          );
        }
     ),

      ],

    );
  }
}





