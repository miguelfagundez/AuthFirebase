import 'package:flutter_firebase_example/features/shared/ui/data/datasources/ui_firebase_datasource.dart';
import 'package:flutter_firebase_example/features/shared/ui/data/repository/ui_repository_impl.dart';
import 'package:flutter_firebase_example/features/shared/ui/domain/usecases/logout_usecase.dart';
import 'package:flutter_firebase_example/features/shared/ui/presentation/bloc/ui_bloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> uiServices() async {
  // Define Auth Bloc
  final UiFirebaseDataSourceImpl uiFirebaseDataSourceImpl = di
      .registerSingleton(UiFirebaseDataSourceImpl());

  final UiRepositoryImpl uiRepositoryImpl = di.registerSingleton(
    UiRepositoryImpl(uiDataSourceImpl: uiFirebaseDataSourceImpl),
  );

  final LogoutUserUsecase logoutUserUsecase = di.registerSingleton(
    LogoutUserUsecase(uiRepository: uiRepositoryImpl),
  );

  di.registerFactory(() => UiBloc(logoutUserUsecase));
}
