import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:longdo_maps_api3_flutter/longdo_maps_api3_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('longdo_maps_api3_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await LongdoMapsApi3Flutter.platformVersion, '42');
  });
}
