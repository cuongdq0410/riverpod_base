import 'package:flutter_clean_architecture/src/data/local/app_storage.dart';
import 'package:flutter_clean_architecture/src/data/mapper/exception_mapper.dart';
import 'package:flutter_clean_architecture/src/data/otp_repository_impl.dart';
import 'package:flutter_clean_architecture/src/data/user_repository_impl.dart';
import 'package:flutter_clean_architecture/src/domain/repository/otp_repository.dart';
import 'package:flutter_clean_architecture/src/domain/repository/user_repository.dart';
import 'package:flutter_clean_architecture/src/presentation/di/app_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'network_provider.dart';

final appStorageProvider = Provider<AppStorage>(
  (ref) => AppStorage.init(),
);
final exceptionMapper = Provider<ExceptionMapper>(
  (ref) => ExceptionMapper(languageCode: ref.watch(localeCodeProvider)),
);

final userRepository = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(
    ref.watch(mipigApiProvider),
    ref.watch(appStorageProvider),
    ref.watch(exceptionMapper),
  ),
);

final otpRepositoryProvider = Provider<OtpRepository>(
  (ref) => OtpRepositoryImpl(
    ref.watch(mipigApiProvider),
    ref.watch(exceptionMapper),
  ),
);

