// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../util/widget/custom_loading.dart';

// class BannerSlider extends StatefulWidget {
//   final List<TBLBanner> banners;
//   final bool isPremium;
//   // final BodyController bodyController;
//   const BannerSlider({
//     Key? key,
//     required this.banners,
//     required this.isPremium,
//     // required this.bodyController
//   }) : super(key: key);

//   @override
//   State<BannerSlider> createState() => _BannerSliderState();
// }

// class _BannerSliderState extends State<BannerSlider> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 120,
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(25.0),
//           child: CarouselSlider.builder(
//             itemCount: widget.banners.length,
//             itemBuilder: (context, index, realIndex) => GestureDetector(
//               child: CachedNetworkImage(
//                 imageUrl: widget.banners[index].image ?? '',
//                 imageBuilder: (context, imageProvider) => Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 placeholder: (context, url) => const Center(
//                   child: CustomLoading(
//                     size: 20,
//                   ),
//                 ),
//                 errorWidget: (context, url, error) => const Center(
//                   child: Icon(Icons.error),
//                 ),
//               ),
//             ),
//             options: CarouselOptions(
//               viewportFraction: 1,
//               autoPlay: true,
//             ),
//           )),
//     );
//   }
// }
