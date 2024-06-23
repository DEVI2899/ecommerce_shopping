import 'package:ecommerce_task/utils/app_colors.dart';
import 'package:ecommerce_task/view/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/cart_bloc/cart_bloc.dart';
import '../Bloc/cart_bloc/cart_event.dart';
import '../model/product_details.dart';



class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productDetails});
  final ProductDetails productDetails;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
               padding: EdgeInsets.only(left: width * 0.04,right:  width * 0.04),
               child: Container(
                width: width,
                height: height * 0.4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color(0xffdddcde),
                ),
          
               child: Column(
                 children: [
                   SizedBox(
                     height: height * 0.01,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       IconButton(onPressed: (){
                         Navigator.of(context).pop();
                       },
                           icon: const Icon(Icons.arrow_back, size: 35,)
                       ),
                       IconButton(onPressed: (){},
                           icon: const Icon(Icons.favorite_outline_rounded,size: 35))
                     ],
                   ),
                    SizedBox(
                      height: height *0.2,
                        child: Image.network(productDetails.image)
                    )
          
          
          
          
                 ],
               ),
                         ),
             ),
              secondSection(context)
          
            ],
          ),
        ),
      ),
    );
  }

  Widget secondSection(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.03,),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Wrap(
            children: [
              Column(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                Text(productDetails.title,
                  maxLines: 2,
                  softWrap: true,
                  style:  TextStyle(fontSize: width *0.05, fontWeight: FontWeight.bold,
                      color:AppColors.titleTextColor ),),

              ],
            ),
              Padding(
                padding: EdgeInsets.only(right:width *0.05 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('\$${productDetails.price}',
                      style:  TextStyle(fontSize: width *0.04, fontWeight: FontWeight.bold,
                          color:AppColors.ratingColor),
                    ),
                  ],
                ),
              ),
            ]
          ),
          Row(
            children: [
              IconButton(onPressed: (){},
                  icon: const Icon(Icons.star, color: AppColors.ratingColor,)),
              Text(productDetails.rating.rate.toString(),
                style:  TextStyle(fontSize: width *0.05, fontWeight: FontWeight.bold,
                    color:AppColors.ratingColor ),),
              SizedBox(
                width: width* 0.01,
              ),
              Text(productDetails.rating.count.toString(),
                style:  TextStyle(fontSize: width *0.05, fontWeight: FontWeight.normal,
                    color:AppColors.ratingColor),
              ),
              Text('Reviews',
                style:  TextStyle(fontSize: width *0.05, fontWeight: FontWeight.normal,
                    color:AppColors.ratingColor ),)

            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Column(

            children: [
              Padding(
                padding:  EdgeInsets.only(right: width *0.7),
                child: Text('Details',
                  style:  TextStyle(fontSize: width *0.05, fontWeight: FontWeight.bold,
                      color:AppColors.titleTextColor ),),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.07),
                child: Text(productDetails.description,
                  style:  TextStyle(fontSize: width *0.035, fontWeight: FontWeight.normal,
                      color:AppColors.detailTextColor),),
              )
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          colorWidget(context),

        ],
      ),
    );
  }

  Widget colorWidget (BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
         Padding(
           padding: EdgeInsets.only(right: width * 0.7),
           child:  Text("Color:",style:   TextStyle(fontSize: width*0.05, fontWeight: FontWeight.bold,
              color:AppColors.titleTextColor)
           ),

         ),
         Padding(
           padding: EdgeInsets.only(left: width * 0.08),
           child: Row(
            children: [
              _containerWidget(context, AppColors.black),
              SizedBox(
                width: width * 0.02,
              ),
              _containerWidget(context, AppColors.lightOrange),
              SizedBox(
                width: width * 0.02,
              ),
              _containerWidget(context, AppColors.lightBlue),
              SizedBox(
                width: width * 0.02,
              ),
              _containerWidget(context, AppColors.orange)
            ],
                   ),
         ),
         SizedBox(
          height: height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.7),
          child:  Text("Size:",style:   TextStyle(fontSize: width*0.05, fontWeight: FontWeight.bold,
              color:AppColors.titleTextColor)
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.4),
          child: Container(
            height: height * 0.05,
            width: width *0.39,
            decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder (
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.zero,
                        topLeft:   Radius.zero,
                        bottomRight: Radius.zero,
                        topRight: Radius.zero
                    ),
                    side: BorderSide(
                        width: 1,
                        color: AppColors.borderColor
                    )
                )
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text("CHOOSE SIZE:",style:  TextStyle(fontSize: width *0.04, fontWeight: FontWeight.normal,
                color:AppColors.grey)
              ),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios_sharp, size: width * 0.04, color:AppColors.grey))
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
          BlocProvider.of<CartBloc>(context).add(
            AddToCart(
              productId:productDetails.id,
              productName: productDetails.title,
              price: productDetails.rating.rate,
              quantity: 1,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${productDetails.title} added to cart')),
          );
         },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightOrange,
              minimumSize: Size(width*0.8, height* 0.04),
              shape: const RoundedRectangleBorder()
            ),
            child:  Text("Buy Now:",style:   TextStyle(fontSize: width*0.05, fontWeight: FontWeight.bold,
       color:AppColors.white))

        )
      ],
    );
  }


  Widget _containerWidget(BuildContext context ,Color color) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.03,
      width: width *0.08,
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.zero,
                  topLeft:   Radius.zero,
                  bottomRight: Radius.zero,
                  topRight: Radius.zero
              ),
              side: BorderSide(
                  width: 1,
                  color: AppColors.grey
              )
          )
      ),
      child: Container(
        height: height * 0.02,
        width: width *0.05,

        decoration: ShapeDecoration(
            color: color,
            shape: const RoundedRectangleBorder (
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.zero,
                    topLeft:   Radius.zero,
                    bottomRight: Radius.zero,
                    topRight: Radius.zero
                ),
                side: BorderSide(
                    width: 1,
                    color: AppColors.grey
                )
            )
        ),
      ),
    );
  }

}
