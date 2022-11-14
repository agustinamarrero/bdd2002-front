import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'oferts_user_event.dart';
part 'oferts_user_state.dart';

class OfertsUserBloc extends Bloc<OfertsUserEvent, OfertsUserState> {
  
  OfertsUserBloc() : super(const OfertsUserState.initial());

}
