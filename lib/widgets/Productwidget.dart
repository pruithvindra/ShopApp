import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopapp/models/ProductModel.dart';
import 'package:shopapp/providers/repo.dart';
import 'package:shopapp/providers/themeprovider.dart';
import 'package:shopapp/screens/descriptionscreen.dart';

import '../style.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.width,
    required this.product,
  }) : super(key: key);

  final double width;
  final product;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.isDarkMode
            ? Colors.black
            : product.id % 2 == 0
                ? Colors.redAccent.withOpacity(0.1)
                : Colors.blueAccent.withOpacity(0.1),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.pushNamed(context, DescriptionScreen.routename,
                arguments: product);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Hero(
                  tag: product.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        width: width * 0.3,
                        imageUrl: poster_path(product.image)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          product.title,
                          // softWrap: true,
                          // wrapWords: true,
                          maxLines: 1, overflow: TextOverflow.ellipsis,

                          style: Style.display3.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          maxFontSize: 20,
                          minFontSize: 20,
                        ),
                        AutoSizeText("Category: ${product.category}",
                            style: Style.display1.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.stars),
                                AutoSizeText(product.rating.rate.toString(),
                                    style: Style.display2.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.people),
                                AutoSizeText(product.rating.count.toString(),
                                    style: Style.display2.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.attach_money),
                                AutoSizeText(product.price.toString(),
                                    style: Style.display2.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                            OutlinedButton.icon(
                              onPressed: Provider.of<DataProvider>(context,
                                          listen: true)
                                      .cartlist
                                      .contains(product)
                                  ? null
                                  : () {
                                      print('added');
                                      Provider.of<DataProvider>(context,
                                              listen: false)
                                          .addtocart(product);
                                    },
                              icon: Icon(Icons.shopping_cart_outlined),
                              label: AutoSizeText("Add to cart",
                                  style: Style.display2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            )
                          ],
                        ),

                        // AutoSizeText(product.price.toString(),
                        //     style: Style.display3.copyWith(
                        //         fontWeight: FontWeight.bold, fontSize: 25)),
                        // AutoSizeText(
                        //   product.description,
                        //   style: Style.display2,
                        //   maxLines: 3,
                        //   overflow: TextOverflow.ellipsis,
                        //   maxFontSize: 20,
                        //   minFontSize: 15,
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
