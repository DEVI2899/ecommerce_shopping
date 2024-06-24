import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_task/main.dart';
import 'package:ecommerce_task/view/cart_page.dart';
import 'package:ecommerce_task/view/profile_page.dart';
import 'package:ecommerce_task/widgets/custom_dropdown_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_task/widgets/buttons.dart';
import 'package:ecommerce_task/widgets/product_gird.dart';
import 'package:ecommerce_task/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/locale_provider.dart';


class ProductPage extends StatefulWidget {

  const ProductPage({super.key,});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController searchController =TextEditingController();



  //bottom selected index function
  int _selectedIndex =0;
  void onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  bool trans = false;

   Locale _locale = const Locale('ta');





  void _changeLanguage(String languageCode) {
    setState(() {
      switch (languageCode) {
        case 'en':
          _locale = const Locale('en');
          break;
        case 'ta':
          _locale = const Locale('ta');
          break;
        default:
          _locale = const Locale('en');
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
      body: Container(
            color: Colors.white,
            child: _selectedIndex ==0 ?homeWidget(context)
                : _selectedIndex == 2 ? const CartPage()
                :  const ProfilePage()

        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label: 'Home',
              tooltip: 'add box'
            //  backgroundColor: Colors.orange
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop,),
              label:'shop' ,
              tooltip: 'shop',
              //backgroundColor: Colors.pink
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,),
              label: 'cart',
              tooltip: 'cart',
           //   backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: 'profile',
              tooltip: 'profile',
             // backgroundColor: Colors.red
          ),
        ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
          elevation: 5
      ),
      ),
    );

  }

  Widget homeWidget(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final provider=Provider.of<LocaleProvider>(context);
    return Column (
      children :[
        Expanded(
          flex: 2,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.name ,style: const TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w700, fontFamily:'inter' ),),
                      Text(AppLocalizations.of(context)!.message,style: const TextStyle(fontSize:20 ,
                          fontWeight: FontWeight.bold, fontFamily:'inter' ),),
                    ],
                  ),
                  CustomDropDownWidget(provider: provider),


                  CircleAvatar(
                    child: Image.network('https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740&t=st=1719153793~exp=1719154393~hmac=26d012b3d5b4b1927d92550810d0a4edd0b33c6336192f80d5cfdaab2fe5fede'),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Search(),
              SizedBox(
                height: height * 0.02,
              ),
              const Buttons(),
            ],
          ),
        ),
        const Expanded(
            flex: 4,
            child: ProductGird())
      ],
    );
  }



}


