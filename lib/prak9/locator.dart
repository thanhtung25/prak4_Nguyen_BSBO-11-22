
import 'package:get_it/get_it.dart';
import 'package:myapp/prak9/netword_Service.dart';

final locator = GetIt.instance;

void setUp(){
  locator.registerSingleton(NetwordSevice());
}