import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/assets_path.dart';
import '../../../../theme/app_style.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.illusionTextColor,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Column(
            children: [
              Image.asset(
                AssetsPath.splash,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 80,),
              Center(
                child: Image.asset(
                  AssetsPath.mftTransparent,
                  height: 70,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  AppText.myFlowerTree,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}


// class SplashscreenWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Figma Flutter Generator SplashscreenWidget - FRAME
//     return Container(
//         width: 360,
//         height: 800,
//         decoration: BoxDecoration(
//           color : Color.fromRGBO(255, 255, 255, 1),
//         ),
//         child: Stack(
//             children: <Widget>[
//               Positioned(
//                   top: -236,
//                   left: -80,
//                   child: Container(
//                       width: 520,
//                       height: 520,
//                       decoration: BoxDecoration(
//                         color : Color.fromRGBO(255, 239, 246, 1),
//                         borderRadius : BorderRadius.all(Radius.elliptical(520, 520)),
//                       )
//                   )
//               ),Positioned(
//                   top: 0,
//                   left: 0,
//                   child: Container(
//                       width: 360,
//                       height: 24,
//                       decoration: BoxDecoration(
//
//                       ),
//                       child: Stack(
//                           children: <Widget>[
//                             Positioned(
//                                 top: 6,
//                                 left: 282,
//                                 child: Container(
//                                     width: 62,
//                                     height: 11,
//
//                                     child: Stack(
//                                         children: <Widget>[
//                                           Positioned(
//                                               top: 0,
//                                               left: 0,
//                                               child: Container(
//                                                   width: 16,
//                                                   height: 11,
//                                                   decoration: BoxDecoration(
//
//                                                   ),
//                                                   child: Stack(
//                                                       children: <Widget>[
//                                                         Positioned(
//                                                             top: 0,
//                                                             left: 0,
//                                                             child: Container(
//                                                                 width: 15.998863220214844,
//                                                                 height: 10.568246841430664,
//
//                                                                 child: Stack(
//                                                                     children: <Widget>[
//                                                                       Positioned(
//                                                                           top: 0,
//                                                                           left: 12.972981452941895,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill21.svg',
//                                                                               semanticsLabel: 'fill21'
//                                                                           );
//                                                                       ),Positioned(
//                                                                           top: 2.297245979309082,
//                                                                           left: 8.6492919921875,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill23.svg',
//                                                                               semanticsLabel: 'fill23'
//                                                                           );
//                                                                       ),Positioned(
//                                                                           top: 4.594491958618164,
//                                                                           left: 4.32464599609375,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill25.svg',
//                                                                               semanticsLabel: 'fill25'
//                                                                           );
//                                                                       ),Positioned(
//                                                                           top: 5.972839832305908,
//                                                                           left: 0,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill27.svg',
//                                                                               semanticsLabel: 'fill27'
//                                                                           );
//                                                                       ),
//                                                                     ]
//                                                                 )
//                                                             )
//                                                         ),
//                                                       ]
//                                                   )
//                                               )
//                                           ),Positioned(
//                                               top: 0,
//                                               left: 20,
//                                               child: Container(
//                                                   width: 14,
//                                                   height: 11,
//                                                   decoration: BoxDecoration(
//
//                                                   ),
//                                                   child: Stack(
//                                                       children: <Widget>[
//                                                         Positioned(
//                                                             top: 0,
//                                                             left: 0,
//                                                             child: Container(
//                                                                 width: 13.385866165161133,
//                                                                 height: 10.568636894226074,
//
//                                                                 child: Stack(
//                                                                     children: <Widget>[
//                                                                       Positioned(
//                                                                           top: 6.600635051727295,
//                                                                           left: 4.5943217277526855,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill29.svg',
//                                                                               semanticsLabel: 'fill29'
//                                                                           );
//                                                                       ),Positioned(
//                                                                           top: 3.390068292617798,
//                                                                           left: 2.30428147315979,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill31.svg',
//                                                                               semanticsLabel: 'fill31'
//                                                                           );
//                                                                       ),Positioned(
//                                                                           top: 0,
//                                                                           left: -5.417888360170764e-14,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill33.svg',
//                                                                               semanticsLabel: 'fill33'
//                                                                           );
//                                                                       ),
//                                                                     ]
//                                                                 )
//                                                             )
//                                                         ),
//                                                       ]
//                                                   )
//                                               )
//                                           ),Positioned(
//                                               top: 0,
//                                               left: 38,
//                                               child: Container(
//                                                   width: 24,
//                                                   height: 11,
//                                                   decoration: BoxDecoration(
//
//                                                   ),
//                                                   child: Stack(
//                                                       children: <Widget>[
//                                                         Positioned(
//                                                             top: 0,
//                                                             left: 0,
//                                                             child: Container(
//                                                                 width: 23.279844284057617,
//                                                                 height: 11,
//
//                                                                 child: Stack(
//                                                                     children: <Widget>[
//                                                                       Positioned(
//                                                                           top: 1.9996271133422852,
//                                                                           left: 1.919921875,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill35.svg',
//                                                                               semanticsLabel: 'fill35'
//                                                                           );
//                                                                       ),Positioned(
//                                                                           top: 0,
//                                                                           left: 0,
//                                                                           child: null
//                                                                       ),Positioned(
//                                                                           top: 3.499812364578247,
//                                                                           left: 21.83984375,
//                                                                           child: SvgPicture.asset(
//                                                                               'assets/images/fill39.svg',
//                                                                               semanticsLabel: 'fill39'
//                                                                           );
//                                                                       ),
//                                                                     ]
//                                                                 )
//                                                             )
//                                                         ),
//                                                       ]
//                                                   )
//                                               )
//                                           ),
//                                         ]
//                                     )
//                                 )
//                             ),
//                           ]
//                       )
//                   )
//               ),Positioned(
//                   top: 365,
//                   left: 113,
//                   child: Container(
//                       width: 134,
//                       height: 70,
//                       decoration: BoxDecoration(
//                         image : DecorationImage(
//                             image: AssetImage('assets/images/Image11.png'),
//                             fit: BoxFit.fitWidth
//                         ),
//                       )
//                   )
//               ),Positioned(
//                   top: 728,
//                   left: 0,
//                   child: Container(
//                     decoration: BoxDecoration(
//
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//
//                       children: <Widget>[
//                         Text('My Flower Tree', textAlign: TextAlign.left, style: TextStyle(
//                             color: Color.fromRGBO(155, 19, 79, 1),
//                             fontFamily: 'Outfit',
//                             fontSize: 18,
//                             letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                             fontWeight: FontWeight.normal,
//                             height: 1.4444444444444444
//                         ),),
//
//                       ],
//                     ),
//                   )
//               ),
//             ]
//         )
//     );
//   }
// }
