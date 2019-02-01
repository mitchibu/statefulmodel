import 'package:package_info/package_info.dart';
import 'package:statefulmodel/statefulmodel.dart';

class AppModel extends Model {
  AppModel(this._packageInfo);
  final PackageInfo _packageInfo;
  PackageInfo get packageInfo => _packageInfo;
}
