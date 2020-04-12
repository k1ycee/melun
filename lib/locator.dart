import 'package:big_field_data/auth/auth.dart';
import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:get_it/get_it.dart';



GetIt locator = GetIt.instance;


void locatorSetup(){
  locator.registerLazySingleton(() => Auth());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserActivity());
}
