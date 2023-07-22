import 'package:flutter/material.dart';
import 'package:flutterbloctesting/feature/cart/bloc/cart_bloc.dart';

import 'package:flutterbloctesting/feature/home/models/home_product_data_model.dart';

class CartProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartProductTileWidget({Key? key, required this.productDataModel, required this.cartBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(productDataModel.imageUrl)),
            ),
          ),
          SizedBox(height: 10,),
          Text(productDataModel.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
          SizedBox(height:5 ,),
          Text(productDataModel.description),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text('\$'+productDataModel.price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),

              Row(
                children: [
                  IconButton(onPressed: (){
                    cartBloc.add(RemoveFromCartEvent(productDataModel: productDataModel));
                  },
                      icon: Icon(Icons.shopping_basket)),

               //   IconButton(onPressed: (){
                //
                //  },
                //      icon: Icon(Icons.shopping_basket_sharp)),
                ],),

            ],),
        ],
      ),
    );
  }
}