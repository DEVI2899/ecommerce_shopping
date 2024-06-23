import 'package:ecommerce_task/controller/product_controller.dart';
import 'package:ecommerce_task/view/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ProductGird extends StatefulWidget {
  const ProductGird({super.key});


  @override
  State<ProductGird> createState() => _ProductGirdState();
}

class _ProductGirdState extends State<ProductGird> {

  @override
  Widget build(BuildContext context) {
    final productItems = Provider.of<ProductController>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
           future: productItems.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3/ 3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 25.0,
                ),
                    scrollDirection: Axis.vertical,
                     itemCount: productItems.productData.length,
                     itemBuilder: (context, index) {
                      final products = productItems.productData[index];
                     return Column(
                       children: [
                         Container(
                           height: height *0.13,
                           width: width * 0.5,
                           decoration: const BoxDecoration(
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(40),
                               topRight: Radius.circular(40),
                               bottomLeft: Radius.circular(40),
                               bottomRight: Radius.circular(40),
                             ),
                           ),
                           child: InkWell(
                              onTap: () => Navigator.push( context,
                                MaterialPageRoute(builder: (context) => ProductDetailPage(productDetails: products,)),),
                             child: Card(
                              elevation: 10,
                                child: CachedNetworkImage(
                                  imageUrl:products.image ,
                                  placeholder: (context, url) =>
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                           ),
                         ),

                         Column(
                           children: [
                           //  Text(products.title),
                             Text(products.price)
                           ],
                         )
                       ],
                     );
                  },

                );

              }
            }

    );
  }
}
