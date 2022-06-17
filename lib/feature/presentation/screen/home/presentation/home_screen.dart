import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task/feature/presentation/bloc/crypto/crypto_cubit.dart';
import 'package:flutter_bloc_task/feature/presentation/bloc/crypto/crypto_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CryptoCubit? _cryptoCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _cryptoCubit = BlocProvider.of<CryptoCubit>(context);
    _cryptoCubit?.fetchCryptoCurrency('ethusd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CryptoCubit, CryptoState>(
        bloc: _cryptoCubit,
        builder: (BuildContext context, CryptoState state) {
          if (state is CryptoLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CryptoErrorState) {
            return Center(child: Text(state.error));
          }

          return const Scaffold(body: Center(child: Text('Home')));
        },
      ),
    );
  }
}
