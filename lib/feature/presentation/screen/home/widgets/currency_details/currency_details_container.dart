import 'package:flutter/material.dart';
import 'package:flutter_bloc_task/feature/presentation/screen/home/widgets/currency_details/currency_details_row.dart';
import 'package:flutter_bloc_task/utils/app_color.dart';

class CurrencyDetailsContainer extends StatelessWidget {
  const CurrencyDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("BTCUSD",
                style: TextStyle(
                    color: AppColor.darkTextColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600)),
            Text("19 Dec 2020, 15:44:23",
                style: TextStyle(
                    color: AppColor.darkGreyTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600))
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: const [
            Expanded(
                child:
                    CurrencyDetailsRow(titleName: "OPEN", data: "\$ 23,142.0")),
            Expanded(
                child:
                    CurrencyDetailsRow(titleName: "HIGH", data: "\$ 23,142.0")),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(
                child:
                    CurrencyDetailsRow(titleName: "LOW", data: "\$ 23,142.0")),
            Expanded(
                child:
                    CurrencyDetailsRow(titleName: "LAST", data: "\$ 23,142.0")),
          ],
        ),
        const SizedBox(height: 16),
        const CurrencyDetailsRow(titleName: "Volume", data: "23,142.0"),
        const SizedBox(height: 20),
      ],
    );
  }
}
