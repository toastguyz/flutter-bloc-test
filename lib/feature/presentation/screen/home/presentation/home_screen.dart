import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task/feature/presentation/bloc/crypto/crypto_cubit.dart';
import 'package:flutter_bloc_task/feature/presentation/bloc/crypto/crypto_state.dart';
import 'package:flutter_bloc_task/feature/presentation/screen/home/widgets/currency_details/currency_details_container.dart';
import 'package:flutter_bloc_task/feature/presentation/screen/home/widgets/order_book/order_book_item_row.dart';
import 'package:flutter_bloc_task/feature/presentation/screen/home/widgets/order_book/order_book_item_title.dart';
import 'package:flutter_bloc_task/feature/presentation/screen/home/widgets/search_currency_placeholder.dart';
import 'package:flutter_bloc_task/utils/app_color.dart';
import 'package:flutter_bloc_task/utils/app_image.dart';
import 'package:flutter_bloc_task/utils/app_utils.dart';
import 'package:flutter_bloc_task/widgets/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  CryptoCubit? _cryptoCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _cryptoCubit = BlocProvider.of<CryptoCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CryptoCubit, CryptoState>(
        bloc: _cryptoCubit,
        builder: (BuildContext context, CryptoState state) {
          if (state is CryptoErrorState) {
            return Scaffold(body: Center(child: Text(state.error)));
          } else if (state is CryptoInitState || state is CryptoLoadedState) {
            return Scaffold(
              floatingActionButton: Visibility(
                  visible: state is CryptoLoadedState,
                  child: FloatingActionButton(
                      onPressed: () {
                        final keyword =
                            searchController.text.toLowerCase().trim();

                        if (keyword.length > 5 && keyword.length <= 8) {
                          _cryptoCubit?.fetchCryptoCurrency(keyword);
                        } else {
                          searchController.clear();
                          _cryptoCubit?.fetchCryptoCurrency('btcusd');
                        }
                      },
                      backgroundColor: AppColor.darkPurpleTextColor,
                      child: Image.asset(AppImage.imgRecycle,
                          color: AppColor.whiteColor, height: 24, width: 24))),
              body: SafeArea(
                child: Column(
                  children: [
                    CustomSearch(
                        searchController: searchController,
                        onTap: () {
                          final keyword =
                              searchController.text.toLowerCase().trim();

                          if (keyword.length > 5 && keyword.length <= 8) {
                            _cryptoCubit?.fetchCryptoCurrency(keyword);
                          } else {
                            AppUtils.showSnackBar(
                                context, 'Please enter a valid currency pair.');
                          }
                        }),
                    Visibility(
                        visible: state is CryptoInitState,
                        child: const SearchCurrencyPlaceholder()),
                    Visibility(
                      visible: state is CryptoLoadedState,
                      child: Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CurrencyDetailsContainer(),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        // isView = !isView;
                                        // setState(() {});
                                      },
                                      child: Text(
                                          // isView
                                          true
                                              ? "HIDE ORDER BOOK"
                                              : "VIEW ORDER BOOK",
                                          style: TextStyle(
                                              color:
                                                  AppColor.darkPurpleTextColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)))),
                              const SizedBox(height: 20),
                              Visibility(
                                  // visible: isView,
                                  child: Text("ORDER BOOK",
                                      style: TextStyle(
                                          color: AppColor.greyTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))),
                              Visibility(
                                // visible: isView,
                                visible: true,
                                child: Card(
                                  margin:
                                      const EdgeInsets.only(top: 4, bottom: 20),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Column(
                                      children: [
                                        const OrderBookItemTitle(),
                                        const SizedBox(height: 8),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 25,
                                            itemBuilder: (context, index) {
                                              return const OrderBookItemRow();
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
