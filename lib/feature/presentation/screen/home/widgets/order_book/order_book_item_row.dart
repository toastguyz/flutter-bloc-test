import 'package:flutter/material.dart';
import 'package:flutter_bloc_task/utils/app_color.dart';

class OrderBookItemRow extends StatelessWidget {
  const OrderBookItemRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 3,
              child: Text("23109.93",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.greyTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))),
          const SizedBox(width: 4),
          Expanded(
              flex: 4,
              child: Text("0.075000000000",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.greyTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))),
          const SizedBox(width: 8),
          Expanded(
              flex: 4,
              child: Text("0.075000000000",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.greyTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))),
          const SizedBox(width: 4),
          Expanded(
              flex: 3,
              child: Text("23110.93",
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.greyTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400)))
        ],
      ),
    );
  }
}
