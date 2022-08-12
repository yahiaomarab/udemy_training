abstract class newappstates{}
class intialstate extends newappstates{}
class bottomnavgstate extends newappstates{}
class newindexstate extends newappstates{}
class businessloadingstate extends newappstates{}
class scienceloadingstate extends newappstates{}
class sportsloadingstate extends newappstates{}
class newgetbusinesssucessdata extends newappstates{}
class newgetbusinesserorrdata extends newappstates{
  final String erorr;
  newgetbusinesserorrdata(this.erorr);
}
class newgetsciencesucessdata extends newappstates{}
class newgetscienceerorrdata extends newappstates{
  final String erorr;
  newgetscienceerorrdata(this.erorr);
}
class newgetsportssucessdata extends newappstates{}
class newgetsportserorrdata extends newappstates{
  final String erorr;
  newgetsportserorrdata(this.erorr);
}
class searchloadingstate extends newappstates{}
class newgetsearchsucessdata extends newappstates{}
class newgetsearcherorrdata extends newappstates{
  final String erorr;
  newgetsearcherorrdata(this.erorr);
}