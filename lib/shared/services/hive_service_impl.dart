import 'package:app/shared/services/hive_service.dart';
import 'package:hive/hive.dart';

//TODO: fazer testes integrados
class HiveServiceImpl extends HiveService {
  @override
  Future saveData(String boxName, data) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).put(boxName, data);
    } else {
      final box = await Hive.openBox(boxName);
      await box.put(boxName, data);
    }
  }

  @override
  Box<dynamic> get(String boxName) {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }

    return null;
  }

  @override
  void deleteBoxes() async {
    await Hive.close();
  }
}
