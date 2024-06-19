import "package:monumentuz/library.dart";
import "package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_main_model.dart";
import "package:monumentuz/src/domain/models/remote_models.dart/filter_data_model.dart";
import "package:monumentuz/src/domain/models/remote_models.dart/search_main_model.dart";

abstract class UserRepository{
Future<AllManumentMainDataList?> getAllManuments();
Future<AllManumentMainDataList?> getOneManuments(int id);
Future<SearchMainModel?> searchMonument(String title);
Future<MainFilterModel?> filterMonument();
Future<AllManumentMainDataList?> betweenManument(String yearOne, String yearTwo);
}