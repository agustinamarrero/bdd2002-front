import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'active_oferts_event.dart';
part 'active_oferts_state.dart';

class ActiveOfertsBloc extends Bloc<ActiveOfertsEvent, ActiveOfertsState> {
  
  ActiveOfertsBloc() : super(const ActiveOfertsState.initial());

}
