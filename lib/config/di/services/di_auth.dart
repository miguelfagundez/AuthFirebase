import 'package:flutter_firebase_example/features/auth/data/datasources/firebase_datasource.dart';
import 'package:flutter_firebase_example/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_firebase_example/features/auth/domain/usecases/authenticate_user_with_email_usecase.dart';
import 'package:flutter_firebase_example/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:flutter_firebase_example/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:flutter_firebase_example/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> authServices() async {
  // Define Auth Bloc
  final AuthFirebaseDataSourceImpl authFirebaseDataSource = di
      .registerSingleton(AuthFirebaseDataSourceImpl());

  final AuthRepositoryImpl userRepositoryImpl = di.registerSingleton(
    AuthRepositoryImpl(authFirebaseDataSourceImpl: authFirebaseDataSource),
  );

  final AuthenticateUserWithEmailUsecase authenticateUserWithEmailUsecase = di
      .registerSingleton(
        AuthenticateUserWithEmailUsecase(authRepository: userRepositoryImpl),
      );
  final ForgotPasswordUsecase forgotPasswordUsecase = di.registerSingleton(
    ForgotPasswordUsecase(authRepository: userRepositoryImpl),
  );
  final RegisterUserUsecase registerUserUsecase = di.registerSingleton(
    RegisterUserUsecase(authRepository: userRepositoryImpl),
  );

  // final LogoutUseCase logoutUserUsecase = di.registerSingleton(
  //   LogoutUseCase(userRepository: userRepositoryImpl),
  // );

  di.registerFactory(
    () => AuthBloc(
      authenticateUserWithEmailUsecase,
      forgotPasswordUsecase,
      registerUserUsecase,
      // logoutUserUsecase,
    ),
  );
}
