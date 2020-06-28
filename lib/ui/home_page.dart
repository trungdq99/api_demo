import 'package:apidemo/blocs/bloc_provider.dart';
import 'package:apidemo/blocs/room_type_bloc.dart';
import 'package:apidemo/models/room_type_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = RoomTypeBloc();
  String _selectRoomType;
  List<RoomTypeModel> _listRoomType;
  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    bloc.loadRoomType().whenComplete(() {
      _selectRoomType = bloc.listRoomType[0].code;
    });
    //_selectRoomType = bloc.listRoomType[0].code;
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Text('Room type'),
          ),
          //Room type drop down button
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: StreamBuilder<List<RoomTypeModel>>(
              stream: bloc.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _listRoomType = snapshot.data;
                  return DropdownButton(
                    value: _selectRoomType,
                    items: _listRoomType.map((value) {
                      return DropdownMenuItem(
                        child: Text(value.name),
                        value: value.code,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectRoomType = value;
                        print(_selectRoomType);
                      });
                    },
                  );
                } else {
                  return Text('Load data failed!');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
