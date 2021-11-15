// import 'package:fitness_app_development/utilities/results.dart';
// import 'package:fitness_app_development/utilities/results_runs.dart';
import 'package:blockchain_app/pages/utilities/results.dart';
import 'package:blockchain_app/pages/utilities/results_runs.dart';
import 'package:blockchain_app/pages/login_screen/login_screen_view_model.dart';


class GlobalData
{
  static late String userId;
  static late String firstName;
  static late String lastName;
  static late String? fullName;
  static String? userName; // required
  static late String email; // required
  static late String companyAddress;
  static late String companyName;
  static String? position;
  static late bool isSeller;
  // static int? totalRuns;
  // static double? totalDistance;
  // static int? totalTime;
  // static late String formattedTime;
  static late List<GetResults2> resultObjs;
  static late List<GetResults> resultObjsBoo;
  // static late List<double> distance;
  static late List<String> userIdInOrder;
  static late List<int> orginalIndex;
  late List<MapEntry<int, double>> sortedEntries;




}