import 'package:flutter/material.dart';
import 'package:flutter_bloc_task/feature/domain/entity/crypto_currency_response.dart';
import 'package:flutter_bloc_task/feature/presentation/screen/home/widgets/currency_details/currency_details_row.dart';
import 'package:flutter_bloc_task/utils/app_color.dart';

class CurrencyDetailsContainer extends StatelessWidget {
  const CurrencyDetailsContainer(
      {required this.cryptoCurrencyResponse, Key? key})
      : super(key: key);

  final CryptoCurrencyResponse cryptoCurrencyResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(cryptoCurrencyResponse.cryptoCurrency?.currency ?? '',
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
          children: [
            Expanded(
                child: CurrencyDetailsRow(
                    titleName: 'OPEN',
                    data:
                        '\$ ${cryptoCurrencyResponse.cryptoCurrency?.open ?? '0.0'}')),
            Expanded(
                child: CurrencyDetailsRow(
                    titleName: 'HIGH',
                    data:
                        '\$ ${cryptoCurrencyResponse.cryptoCurrency?.high ?? '0.0'}')),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: CurrencyDetailsRow(
                    titleName: 'LOW',
                    data:
                        '\$ ${cryptoCurrencyResponse.cryptoCurrency?.low ?? '0.0'}')),
            Expanded(
                child: CurrencyDetailsRow(
                    titleName: 'LAST',
                    data:
                        '\$ ${cryptoCurrencyResponse.cryptoCurrency?.last ?? '0.0'}')),
          ],
        ),
        const SizedBox(height: 16),
        CurrencyDetailsRow(
            titleName: 'Volume',
            data: cryptoCurrencyResponse.cryptoCurrency?.open ?? '0.0'),
        const SizedBox(height: 20),
      ],
    );
  }
}
