
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironMent {

  static String movieDbKey = dotenv.env["THE_MOVIEDB_KEY"] ?? "no se encuentra apikey";
}