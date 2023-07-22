import 'package:flutter/material.dart';
import 'package:flutterbloctesting/feature/home/bloc/home_bloc.dart';
import 'package:flutterbloctesting/feature/home/models/home_product_data_model.dart';
import 'package:flutterbloctesting/feature/wishlist/bloc/wishlist_bloc.dart';

class WishlistProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistProductTileWidget({Key? key, required this.productDataModel, required this.wishlistBloc}) : super(key: key);

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

                  },
                      icon: Icon(Icons.favorite_border_sharp)),

                //  IconButton(onPressed: (){
               //    homeBloc.add(HomeProductCartButtonClickedEvent(currentIndividualProductClicked: productDataModel));
               //   },
                //      icon: Icon(Icons.shopping_basket_outlined)),
                ],),

            ],),
        ],
      ),
    );
  }
}