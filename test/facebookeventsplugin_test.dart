import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:facebookeventsplugin/facebookeventsplugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('facebookeventsplugin');

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
    expect(await Facebookeventsplugin.platformVersion, '42');
  });
}
