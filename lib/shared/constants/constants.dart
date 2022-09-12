import 'package:appoo/shared/network/local/cache-helper.dart';

import '../../modules/social-app/social_login_app/social_login_app.dart';
import '../component/component.dart';

void signout(context)
{
  cachehelper.removedata(key: 'token').then((value)
  {
    if(value)
    {
      navandreplace(context, sociallogin());
    }
  });
}
String token='';
String uId='';