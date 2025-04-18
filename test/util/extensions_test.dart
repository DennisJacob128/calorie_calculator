import 'package:calorie_calculator/util/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('RoundedStringDouble', () {
    group('roundedString', () {
      test('should remove comma', () {
        expect(0.0.roundedString(), '0');
        expect(5.0.roundedString(), '5');
        expect((-3.0).roundedString(), '-3');
      });

      test('should not round', () {
        expect(3.14.roundedString(), '3.14');
        expect((-2.718).roundedString(), '-2.718');
      });
    });
  });

  group('StringCasingExtension', () {
    group('capitalize', () {
      test('empty string', () {
        expect(''.capitalize, '');
      });

      test('capitalizes first letter', () {
        expect('a'.capitalize, 'A');
        expect('A'.capitalize, 'A');

        expect('hello'.capitalize, 'Hello');
        expect('hELLO'.capitalize, 'HELLO');
      });

      test('does not change capitalized', () {
        expect('Test'.capitalize, 'Test');
      });
    });
  });
}
