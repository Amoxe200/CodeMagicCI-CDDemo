// Tests to check the initial value of the  counter is 0
// Press the increment button once
// Check if the counter value increased to 1
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app_demo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
            (widgetTester) async{
                app.main();
                await widgetTester.pumpAndSettle();
                // Verify the counter starts at 0.
                expect(find.text('0'), findsOneWidget);

                // Finds the floating action button to tap
                final Finder actionButton = find.byTooltip('Increment');

                //Emulate a tap on the floating action button
                await widgetTester.tap(actionButton);

                // Trigger a frame
                await widgetTester.pumpAndSettle();

                //Verify the counter increments by 1
                expect(find.text('1'), findsOneWidget);

            }
    );
  });
}
