import 'package:flutter/material.dart';
import 'package:flutter_bloc_task/feature/presentation/bloc/crypto/crypto_cubit.dart';
import 'package:flutter_bloc_task/feature/presentation/bloc/crypto/crypto_state.dart';
import 'package:flutter_bloc_task/feature/presentation/screen/home/presentation/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../home_screen_data_test.dart';

class MockCryptoCubit extends CryptoCubit {
  MockCryptoCubit(super.cryptoRepository);

  @override
  Future<void> fetchCryptoCurrency(String currency) async {
    emit(CryptoLoadedState(
        cryptoCurrencyResponse: cryptoCurrencyResponse, isHidden: true));
  }
}

class FakeCryptoState extends Fake implements CryptoState {}

void main() {
  late final CryptoCubit mockCryptoCubit;

  group('Home Screen widget tests', () {
    setUpAll(() async {
      // mockCryptoCubit = BlocProvider.of<CryptoCubit>();
    });

    testWidgets('Should contains home screen widget.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const _TestWidget(
          child: HomeScreen(),
        ),
      );
      await tester.idle();
      await tester.pump();

      expect(find.byType(Scaffold), findsOneWidget);
      // expect(find.byType(FloatingActionButton), findsNWidgets(4));
    });
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(home: child);
}
