import 'package:appoo/models/socialuserregister.dart';

abstract class sociallogappstates {}
class socialintialloginstate extends sociallogappstates{}
class socialloginloadingstate extends sociallogappstates{}
class socialloginsucessstate extends sociallogappstates{
final String uId;
socialloginsucessstate(this.uId);
}
class socialloginerorrstate extends sociallogappstates{
  final String erorr;

  socialloginerorrstate(this.erorr);
}
class socialloginiconchangestate extends sociallogappstates{}