import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/ProductModel.dart';
import 'package:shopapp/providers/repo.dart';
import 'package:shopapp/providers/themeprovider.dart';
import 'package:shopapp/style.dart';

class DescriptionScreen extends StatefulWidget {
  DescriptionScreen({Key? key}) : super(key: key);

  static const routename = 'desc';

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: product.id,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: height * 0.4,
                        width: width,
                        child: CachedNetworkImage(
                          imageUrl: poster_path(product.image),
                          fit: BoxFit.contain,
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Card(
                      color: themeProvider.isDarkMode
                          ? Colors.black
                          : product.id % 2 == 0
                              ? Colors.redAccent.withOpacity(0.1)
                              : Colors.blueAccent.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(product.title,
                                textAlign: TextAlign.center,
                                style: Style.display3.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText("Category: ${product.category}",
                                    style: Style.display2.copyWith()),
                                Row(
                                  children: [
                                    Icon(Icons.stars),
                                    AutoSizeText(product.rating.rate.toString(),
                                        style: Style.display2
                                            .copyWith(fontSize: 15)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.people),
                                    AutoSizeText(
                                        product.rating.count.toString(),
                                        style: Style.display2
                                            .copyWith(fontSize: 15)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            AutoSizeText(
                              product.description,
                              style: Style.display2
                                  .copyWith(letterSpacing: 2, fontSize: 20),
                              maxFontSize: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              top: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(5),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
