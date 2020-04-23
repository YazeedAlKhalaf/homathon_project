import 'package:get_it/get_it.dart';
import 'package:homathon_project/src/services/authentication_service.dart';
import 'package:homathon_project/src/services/dialog_service.dart';
import 'package:homathon_project/src/services/firestore_service.dart';
import 'package:homathon_project/src/services/navigation_service.dart';
import 'package:homathon_project/src/services/storage_service.dart';
import 'package:homathon_project/src/utils/utilities.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => Utils());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => StorageService());
}
