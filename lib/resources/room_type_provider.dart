import '../models/api_response_model.dart';

import '../models/room_type_model.dart';
import './api_provider.dart';

class RoomTypeProvider {
  ApiProvider apiProvider = ApiProvider();
  Future<List<RoomTypeModel>> fetchRoomType(String apiEndPoint) async {
    ApiResponseModel res =
        await apiProvider.fetchData(apiEndPoint); //.whenComplete(() {
    print(res == null);
    if (res != null) {
      List<RoomTypeModel> listRoomType = [];
      res.results.forEach((element) {
        if (element.message.compareTo('Success') == 0) {
          List list = element.data['results'];
          list.forEach((element) {
            RoomTypeModel roomTypeModel = RoomTypeModel(element);
            listRoomType.add(roomTypeModel);
            print(
                '${roomTypeModel.id}|${roomTypeModel.code}|${roomTypeModel.name}|${roomTypeModel.description}');
          });
        }
      });
      print(listRoomType.length);
      return listRoomType;
    } else {
      return null;
    }
    //   });
  }
}
