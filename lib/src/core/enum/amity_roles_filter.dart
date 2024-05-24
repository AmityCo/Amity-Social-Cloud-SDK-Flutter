import 'package:amity_sdk/amity_sdk.dart';

sealed class AmityRolesFilter{

}


class All extends AmityRolesFilter {
  static const String value = 'ALL';
}

class Only extends AmityRolesFilter {
  AmityRoles roles;
  Only(this.roles);
  AmityRoles getRoles(){
    return roles;
  }
}

class Not extends AmityRolesFilter {
  AmityRoles roles;
  Not(this.roles);

  AmityRoles getRoles(){
    return roles;
  }
}