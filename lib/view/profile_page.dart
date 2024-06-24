import 'package:ecommerce_task/utils/app_colors.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key,});


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
          centerTitle: true,
          backgroundColor: AppColors.lightOrange,
        ),
          body : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                height: height* 1.8,
                width: width * 0.97,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: height * 0.2,
                      child: Image.network('https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740&t=st=1719153793~exp=1719154393~hmac=26d012b3d5b4b1927d92550810d0a4edd0b33c6336192f80d5cfdaab2fe5fede'),
                    ),
                    const Text('Dhiraj',
                      style: TextStyle(color:Colors.black, fontWeight:FontWeight.bold, fontSize: 25),
                    ),
              
                    Container(
                      height: height *0.15,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.1
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: ListTile(
              
                        leading: const Icon(Icons.perm_identity_rounded, size: 30,),
                        title: const Text(
                          'Language',
                          style: TextStyle(color:Colors.black, fontWeight:FontWeight.normal, fontSize: 25),
                        ),
                        trailing: IconButton(onPressed: () {  },
                        icon: const Icon(Icons.language, size: 30,)),
                      ),
                    ),
                    Container(
                      height: height *0.15,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: const ListTile(
              
                        leading: Icon(Icons.location_on_outlined, size: 30,),
                        title: Text(
                          'My Address',
                          style: TextStyle(color:Colors.black, fontWeight:FontWeight.normal, fontSize: 25),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                    Container(
                      height: height *0.15,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: const ListTile(
              
                        leading: Icon(Icons.card_giftcard_outlined, size: 30,),
                        title: Text(
                          'My orders',
                          style: TextStyle(color:Colors.black, fontWeight:FontWeight.normal, fontSize: 25),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                    Container(
                      height: height *0.15,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: const ListTile(
              
                        leading: Icon(Icons.credit_card, size: 30,),
                        title: Text(
                          'My cards',
                          style: TextStyle(color:Colors.black, fontWeight:FontWeight.normal, fontSize: 25),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                    Container(
                      height: height *0.15,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: const ListTile(
              
                        leading: Icon(Icons.settings, size: 30,),
                        title: Text(
                          'settings',
                          style: TextStyle(color:Colors.black, fontWeight:FontWeight.normal, fontSize: 25),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                    Container(
                      height: height *0.15,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: const ListTile(
              
                        leading: Icon(Icons.login_sharp, size: 30,),
                        title: Text(
                          'LogOut',
                          style: TextStyle(color:Colors.black, fontWeight:FontWeight.normal, fontSize: 25),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
              
              
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
