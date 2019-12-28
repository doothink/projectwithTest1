import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/model/profile.dart';

import 'bloc/bloc.dart';

class ProfileMain extends StatefulWidget {
  final int _profileId;

  ProfileMain({Key key, @required int profileId})
      : assert(profileId != null),
        _profileId = profileId,
        super(key: key);

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  ProfileBloc _profileBloc;

  int get _profileId => widget._profileId;
  Profile _profile;

  @override
  void initState() {
    super.initState();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
//    _profileBloc.add(ProfileLoad(profileId: _profileId));
  }

  @override
  Widget build(BuildContext context) {
//    debugPrint(
//        "]-----] ProfileMain::build.description [-----[ ${_profile.club.description}");
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.isLoaded) {
          _profile = state.profile;
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return _profile != null
              ? Container(
                  child: SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Column(
                        children: <Widget>[Text("profile")],
                      ),
                    ),
                  ),
                )
              : Text("");
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
