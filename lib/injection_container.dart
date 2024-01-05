import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:info_profile/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:info_profile/data/repository/firebase_repository_impl.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/create_user_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/get_current_uid_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/get_single_user_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/is_signin_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/signin_user_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/signout_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/signup_user_usecase.dart';
import 'package:info_profile/presentation/cubit/auth/auth_cubit.dart';
import 'package:info_profile/presentation/cubit/credential/credential_cubit.dart';
import 'package:info_profile/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:info_profile/presentation/cubit/user/user_cubit.dart';

import 'data/data_source/remote_data_source/remote_data_source.dart';
import 'domain/repository/firebase_repository.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // cubit
  sl.registerFactory(
    () => AuthCubit(
      signOutUseCase: sl.call(),
      isSigninUseCase: sl.call(),
      getCurrentUserUseCase: sl.call(),
    ),
  );
  sl.registerFactory(
    () => CredentialCubit(
      signUpUserUseCase: sl.call(),
      signinUserUseCase: sl.call(),
    ),
  );
  sl.registerFactory(
    () => UserCubit(
      updateUserUseCase: sl.call(),
      getUsersUseCase: sl.call(),
    ),
  );
  sl.registerFactory(
    () => GetSingleUserCubit(getSingleUserUseCase: sl.call()),
  );
  // use cases
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSigninUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SigninUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleUserUseCase(repository: sl.call()));

  sl.registerLazySingleton(() => CreateUserUseCase(repository: sl.call()));

  // repository
  sl.registerLazySingleton<FirebaseRepository>(
    () => FirebaseRepositoryImpl(
      remoteDataSource: sl.call(),
    ),
  );
  // remote data source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      firebaseAuth: sl.call(),
      firebaseFirestore: sl.call(),
    ),
  );

  // externals
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
}
