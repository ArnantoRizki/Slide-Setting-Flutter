import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/dashboard-settings/dashboard-settings-bloc.dart';
import 'dashboard-body.dart';
import 'dashboard-settings.dart';


class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardSettingsBloc>(
      create: (_)=>DashboardSettingsBloc(),
      child: DashboardView(),
    );
  }
}

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  double height, width;

  DashboardSettingsBloc provider;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    provider = BlocProvider.of<DashboardSettingsBloc>(context);
    _scrollController = new ScrollController();

    if(provider != null){
      provider.add(SettingActions.SET_INIT);
    }
  }

  @override
  void dispose() {
    provider.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return BlocListener<DashboardSettingsBloc, SettingState>(
      listener: (context, stateListener){
        if(stateListener == SettingState.INIT){
          _scrollController.jumpTo(width*0.0);
        }else if(stateListener == SettingState.OPENED){
          _scrollController.animateTo(width*0.6, duration: Duration(milliseconds: 300), curve: Curves.linear,);
        }else if(stateListener == SettingState.CLOSED){
          _scrollController.animateTo(width*0.0, duration: Duration(milliseconds: 300), curve: Curves.linear,);
        }
      },
      child: BlocBuilder<DashboardSettingsBloc, SettingState>(
        builder: (context, state){
          return ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    DashboardBody(
                      onSettingsTap: (){
                        provider.add(SettingActions.OPEN);
                      },
                    ),
                    state == SettingState.OPENED? Positioned(
                      right: 0.0,
                      top: 0.0,
                      height: height,
                      width: width,
                      child: Container(
                        height: height,
                        width: width,
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: (){
                            provider.add(SettingActions.CLOSE);
                          },
                        ),
                      )
                    ):Container()
                  ],
                )
              ),
              Container(
                width: width * 0.6,
                height: height,
                child: DashboardSettings(),
              ),
            ]
          );
        }
      ),
    ); 
  }
}
