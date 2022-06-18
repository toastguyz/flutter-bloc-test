import 'package:flutter/material.dart';
import 'package:flutter_bloc_task/utils/app_color.dart';
import 'package:flutter_bloc_task/utils/app_image.dart';

class CustomSearch extends StatefulWidget {
  final TextEditingController searchController;
  final VoidCallback onTap;

  const CustomSearch(
      {required this.searchController, required this.onTap, Key? key})
      : super(key: key);

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColor.searchBarGreyColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4))),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  controller: widget.searchController,
                  decoration: InputDecoration(
                      hintText: "Enter currency pair",
                      hintStyle: TextStyle(color: AppColor.lightTextColor),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none)))),
          GestureDetector(
              onTap: widget.onTap,
              child: Image.asset(AppImage.imgSearch,
                  fit: BoxFit.cover, height: 20, width: 20))
        ],
      ),
    );
  }
}

// class CustomSearch extends StatefulWidget {
//   final TextEditingController searchController;
//   final VoidCallback onTap;
//
//   const CustomSearch(
//       {required this.searchController, required this.onTap, Key? key})
//       : super(key: key);
//
//   @override
//   _CustomSearchState createState() => _CustomSearchState();
// }
//
// class _CustomSearchState extends State<CustomSearch> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//           color: AppColor.searchBarGreyColor,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(4))),
//       child: Row(
//         children: [
//           Expanded(
//               child: TextFormField(
//                   controller: widget.searchController,
//                   decoration: InputDecoration(
//                       hintText: "Enter currency pair",
//                       hintStyle: TextStyle(color: AppColor.lightTextColor),
//                       border: const UnderlineInputBorder(
//                           borderSide: BorderSide.none)))),
//           GestureDetector(
//               onTap: widget.onTap,
//               child: Image.asset(AppImage.imgSearch,
//                   fit: BoxFit.cover, height: 20, width: 20))
//         ],
//       ),
//     );
//   }
// }
