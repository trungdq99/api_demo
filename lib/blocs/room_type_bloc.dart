import 'dart:async';

import '../resources/room_type_provider.dart';

import '../models/room_type_model.dart';

import 'bloc.dart';

class RoomTypeBloc implements Bloc {
  final _controller = StreamController<List<RoomTypeModel>>();
  final RoomTypeProvider _provider = RoomTypeProvider();
  Stream<List<RoomTypeModel>> get stream => _controller.stream;
  List<RoomTypeModel> _listRoomType;
  List<RoomTypeModel> get listRoomType => _listRoomType;
  Future loadRoomType() async {
    _listRoomType = await _provider.fetchRoomType('/api/roomtypes');
    _controller.sink.add(_listRoomType);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
  }
}
