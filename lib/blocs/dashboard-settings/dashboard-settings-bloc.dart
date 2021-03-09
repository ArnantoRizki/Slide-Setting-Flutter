import 'package:bloc/bloc.dart';

enum SettingActions{
  SET_INIT,
  OPEN,
  CLOSE
}

enum SettingState{
  INIT,
  OPENED,
  CLOSED
}

class DashboardSettingsBloc extends Bloc<SettingActions, SettingState>{
  DashboardSettingsBloc() : super(SettingState.INIT);

  @override
  Stream<SettingState> mapEventToState(SettingActions event)async*{
    if(event == SettingActions.SET_INIT){
      yield SettingState.INIT;
    }else if(event == SettingActions.OPEN){
      yield SettingState.OPENED;
    }else if(event == SettingActions.CLOSE){
      yield SettingState.CLOSED;
    }
  }
}
