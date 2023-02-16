import 'package:flutter_clean_architecture/src/domain/usecase/validate/validate_user_name_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test validate username usecase', () {
    late ValidateEmailUseCase validateUserNameUseCase;
    setUp(() {
      validateUserNameUseCase = ValidateEmailUseCase();
    });

    test('test validate username duongTuan', () async {
      final data = await validateUserNameUseCase.createObservable('duongTuan');
      expect(data, '0');
    });

    test('test validate username empty', () async {
      final data = await validateUserNameUseCase.createObservable('');
      expect(data, '1');
    });

    test('test validate username asdajksldjasldjkx32523', () async {
      final data = await validateUserNameUseCase
          .createObservable('asdajksldjasldjkx32523');
      expect(data, '0');
    });
  });
}
