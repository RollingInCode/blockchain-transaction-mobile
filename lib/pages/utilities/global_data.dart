// import 'package:fitness_app_development/utilities/results.dart';
// import 'package:fitness_app_development/utilities/results_runs.dart';
import 'package:blockchain_app/pages/utilities/results.dart';
import 'package:blockchain_app/pages/utilities/results_runs.dart';
import 'package:blockchain_app/pages/login_screen/login_screen_view_model.dart';


class GlobalData
{
  static late String userId;
  static late String firstName;
  static String? lastName;
  static String? fullName;
  static late String userName;
  static late String email;
  static String? companyAddress;
  static String? companyName;
  static String? position;
  static bool? isSeller;
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