
import 'package:appoo/models/userlogin.dart';

abstract class registappstates {}
class intialregisterstate extends registappstates{}
class registerloadingstate extends registappstates{}
class registersucessstate extends registappstates{
  final Shoploginuser modellogin;

  registersucessstate(this.modellogin);

}
class registererorrstate extends registappstates{
  final String erorr;

  registererorrstate(this.erorr);
}
class registericonchangestate extends registappstates{}