
import 'package:appoo/models/userlogin.dart';

abstract class socialregistappstates {}
class socialintialregisterstate extends socialregistappstates{}
class socialregisterloadingstate extends socialregistappstates{}
class socialregistersucessstate extends socialregistappstates{


}
class socialregistererorrstate extends socialregistappstates{
  final String erorr;

  socialregistererorrstate(this.erorr);
}
class socialcreateuserregistersucessstate extends socialregistappstates{


}
class socialcreateuserregistererorrstate extends socialregistappstates{
  final String erorr;

  socialcreateuserregistererorrstate(this.erorr);
}
class socialregistericonchangestate extends socialregistappstates{}
