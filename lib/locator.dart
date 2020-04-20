import 'package:big_field_data/auth/auth.dart';
import 'package:big_field_data/auth/cloud_storage.dart';
import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/utils/image_selector.dart';
import 'package:get_it/get_it.dart';



GetIt locator = GetIt.instance;

// This would be used for dependency injection :)

void locatorSetup(){
  locator.registerLazySingleton(() => Auth());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserActivity());
  locator.registerLazySingleton(() => CloudImageUpload());
  locator.registerLazySingleton(() => ImageSelector());
}
