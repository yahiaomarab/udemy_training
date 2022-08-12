abstract class socialappstates{}
class socialinitialappstate extends socialappstates{}
class socialgetuserloadingstate extends socialappstates{}
class socialgetusersucessstate extends socialappstates{}
class socialgetusererorrstate extends socialappstates{
  final String erorr;
  socialgetusererorrstate(this.erorr);
}
class socialgetpostsloadingstate extends socialappstates{}
class socialgetpostssucessstate extends socialappstates{}
class socialgetpostserorrstate extends socialappstates{
  final String erorr;
  socialgetpostserorrstate(this.erorr);
}
class socialchangebottomnavstate extends socialappstates{}
class socialaddpoststate extends socialappstates{}
class socialprofileimagepickedsucessstate extends socialappstates{}
class socialprofileimagepickederorrstate extends socialappstates{}
class socialcoverimagepickedsucessstate extends socialappstates{}
class socialcoverimagepickederorrstate extends socialappstates{}
class socialuploadprofileimagesucessstate extends socialappstates{}
class socialuploadprofileimageerorrstate extends socialappstates{}
class socialuploadcoverimagesucessstate extends socialappstates{}
class socialuploadcoverimageerorrstate extends socialappstates{}
class socialUpdateuserloadingstate extends socialappstates{}
class socialUpdateusersucessstate extends socialappstates{}
class socialUpdateusererorrstate extends socialappstates{}
///add post
class socialcreatepostloadingstate extends socialappstates{}
class socialcreatepostsucessstate extends socialappstates{}
class socialcreateposterorrstate extends socialappstates{}
class socialaddpostimagepikedsucessstate extends socialappstates{}
class socialaddpostimagepikederorrstate extends socialappstates{}
class socialclosepostimagestate extends socialappstates{}
///posts likes and comments
class socialgetpostlikesucessstate extends socialappstates{}
class socialgetpostlikeerorrstate extends socialappstates{
  final String erorr;
  socialgetpostlikeerorrstate(this.erorr);
}