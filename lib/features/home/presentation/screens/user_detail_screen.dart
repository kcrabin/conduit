// import 'package:conduit/core/presentation/themes/app_themes.dart';
// import 'package:conduit/core/presentation/themes/colors.dart';
// import 'package:conduit/core/presentation/utils/spacing.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class UserDetail extends StatelessWidget {
//   const UserDetail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: backgroundDark,
//               borderRadius: BorderRadius.circular(10),
              
//             ),
//             child: Column(
//               children: [
//                  SizedBox(
//                                       height: 50,
//                                       child: ClipOval(
                                        
//                                         // child: Image.network(
//                                         //     // getSingleArticleBySlugController
//                                         //     //     .apiResponse.data.author!.image
//                                         //     //     .toString()
//                                         //         ),
//                                       ),
//                                     ),
//                                     Spacing.sizeBoxH_10(),
//                                     Text('Username', style: AppThemes.textTheme.displayLarge,),
//                                     Spacing.sizeBoxH_10(),
//                                     Align(alignment: Alignment.centerRight,
//                                     child: InkWell(
//                                     splashColor: primaryColor,
//                                     onTap: () {
//                                       getSingleArticleBySlugController
//                                                   .apiResponse.data.favorited ==
//                                               true
//                                           ? favController.unlikeArticle(
//                                               getSingleArticleBySlugController
//                                                   .apiResponse.data.slug
//                                                   .toString())
//                                           : favController.likeArticle(
//                                               getSingleArticleBySlugController
//                                                   .apiResponse.data.slug
//                                                   .toString());

//                                       getSingleArticleBySlugController
//                                           .getSelectedArticle(
//                                               getSingleArticleBySlugController
//                                                   .apiResponse.data.slug
//                                                   .toString());
//                                     },
//                                     child: Container(
//                                       padding: const EdgeInsets.all(3),
//                                       decoration: BoxDecoration(
//                                           color:
//                                               getSingleArticleBySlugController
//                                                           .apiResponse
//                                                           .data
//                                                           .favorited ==
//                                                       true
//                                                   ? primaryColor
//                                                   : Colors.transparent,
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           border:
//                                               Border.all(color: whiteColor)),
//                                       child:  Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.add,
//                                                   color: favColor,
//                                                 ),
//                                                 Text(
//                                                   'Unfavorite Article (${getSingleArticleBySlugController.apiResponse.data.favoritesCount.toString()})',
//                                                   style: AppThemes
//                                                       .textTheme.headline2,
//                                                 )
//                                               ],
//                                             )
                                        
//                                     ),
//                                   ),)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }