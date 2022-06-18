import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Order book row item widget tests', () {
    testWidgets('Should contains order book row item widget.',
        (WidgetTester tester) async {
      // await tester.pumpWidget(const _TestWidget(child: OrderBookItemRow()));

      expect(find.text("0.075000000000"), findsNWidgets(2));
      expect(find.text("23109.93"), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(4));
    });
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(home: child);
}
