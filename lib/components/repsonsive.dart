import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static double aspectRadio(BuildContext context) {
    //MediaQueryData queryData;
    return MediaQuery.of(context).devicePixelRatio;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }
  //print(TAG + " height @@@ "+ 16.0.h.toString()+ "--"+10.0.h.toString() + " - width "+ 16.0.w.toString() + "--"+10.0.w.toString());
  //  height @@@ 126.72--79.2 - width 120.8--75.5
  // print(TAG + " fontsize "+ (screenSize.width / 25).toString() );
  //  mobile 20  desktop 31
  // width > 778 landscape  otherwise portrait

//   static double container_image_height_20(BuildContext context){
//     return  30.h <= 200? 110
//         //: MediaQuery.of(context).size.width <=500 ?  12.h
//         : isSmallScreen(context) && MediaQuery.of(context).size.aspectRatio <= 0.80 ? 14.h
//         : isSmallScreen(context) && MediaQuery.of(context).size.aspectRatio > 0.80 ? 16.h
//         : isMediumScreen(context) && MediaQuery.of(context).size.aspectRatio <= 0.80 ? 14.h
//         : isMediumScreen(context)  && MediaQuery.of(context).size.aspectRatio > 0.80 ? 15.h
//         : isLargeScreen(context) ? 15.h
//         : 13.h ;
//   }

//   static double container_height_20(BuildContext context){
//     return 30.h <= 200? 200
//        // : MediaQuery.of(context).size.width <=500 ?  23.h
//         : isSmallScreen(context)  && MediaQuery.of(context).size.aspectRatio <= 0.80 ? 26.h
//         : isSmallScreen(context) && MediaQuery.of(context).size.aspectRatio > 0.80 ? 28.h
//         : isMediumScreen(context) && MediaQuery.of(context).size.aspectRatio <= 0.80 ? 24.h
//         : isMediumScreen(context) && MediaQuery.of(context).size.aspectRatio > 0.80 ? 25.h
//         : isLargeScreen(context) ? 21.h
//         : 22.h ;
//   }
//   static double container_width_20(BuildContext context){
//     return  30.h <= 200? 170
//       //  : MediaQuery.of(context).size.width <=500 ?  20.h
//         : isSmallScreen(context) && MediaQuery.of(context).size.aspectRatio <= 0.80 ? 20.h
//         : isSmallScreen(context) && MediaQuery.of(context).size.aspectRatio > 0.80 ? 21.h
//         : isMediumScreen(context) && MediaQuery.of(context).size.aspectRatio <= 0.80 ? 24.h
//         : isMediumScreen(context)  && MediaQuery.of(context).size.aspectRatio > 0.80 ? 25.h
//         : isLargeScreen(context) ? 15.h
//         : 20.h ;
//   }

//   static double container_height_30(BuildContext context){
//     return  30.h <= 200? 210
//         : isSmallScreen(context) && MediaQuery.of(context).size.aspectRatio <= 0.80 ? 28.h
//         : isSmallScreen(context) && MediaQuery.of(context).size.aspectRatio > 0.80 ? 30.h
//         : isMediumScreen(context) && MediaQuery.of(context).size.aspectRatio <= 0.80 ? 32.h
//         : isMediumScreen(context) && MediaQuery.of(context).size.aspectRatio > 0.80 ? 33.h
//         : isLargeScreen(context) ? 22.h
//         : 23.h;
//   }
//  /* static double container_height_30(BuildContext context){
//     /*return MediaQuery.of(context).orientation == Orientation.portrait ?
//            MediaQuery.of(context).size.width >= 780 ? 220 : 40.h
//           :MediaQuery.of(context).size.width >= 780 ? 320 : 40.h  ;
//     */ hsdjk   this widgeth 20 and height 30 thnn sd sd lkjl dlkjd
//     return MediaQuery.of(context).size.aspectRatio >= 0.80 ? 250 : 30.h  ;
//   }*/

//   static double height_16(){

//     return 16.0.h >= 125 ?  125 : 16.0.h;
//   }
//   static double height_10(){
//     return 10.0.h >= 80 ?  80 : 10.0.h;
//   }

//   static double width_16(){
//     return 16.0.w >= 120 ?  120 : 16.0.w;
//   }

//   static double width_web(){
//     return 16.0.w >= 70 ?  70 : 16.0.w;
//   }
//   static double width_10(){
//     return 10.0.w >= 75 ?  75 : 10.0.w;
//   }

  static double font_20(BuildContext context) {
    return isSmallScreen(context)
        ? 17
        : isMediumScreen(context)
            ? 18
            : 19;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
