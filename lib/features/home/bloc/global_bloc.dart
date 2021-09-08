import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sma/data/exceptions.dart';
import 'package:sma/data/repository.dart';
import 'package:sma/features/home/model/global.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final Repository repository;
  GlobalBloc({required this.repository}) : super(const GlobalInitial());

  GlobalState get initialState => const GlobalInitial();

  @override
  Stream<GlobalState> mapEventToState(GlobalEvent event) async* {
    yield const GlobalLoading();
    if(event is GetGlobalData) {
      try {
        final globalData = await repository.fetchGlobalData();
        yield GlobalDataLoaded(globalData);
      } catch (e) {
        if(e is InvalidFormatException) {
          yield GlobalError(e.message);
        } else {
          yield const GlobalError("repository is null");
        }
      }
    }
  }
}

//EVENT
abstract class GlobalEvent extends Equatable {
  const GlobalEvent();
}

class GetGlobalData extends GlobalEvent {
  const GetGlobalData();

  @override
  List<Object?> get props => [];
}

//STATE
abstract class GlobalState extends Equatable {
  const GlobalState();
}

class GlobalInitial extends GlobalState {
  const GlobalInitial();

  @override
  List<Object?> get props => [];
}

class GlobalLoading extends GlobalState {
  const GlobalLoading();

  @override
  List<Object?> get props => [];
}

class GlobalDataLoaded extends GlobalState {
  final Global global;

  const GlobalDataLoaded(this.global);

  @override
  List<Object?> get props => [];
}

class GlobalError extends GlobalState {
  final String message;

  const GlobalError(this.message);

  @override
  List<Object?> get props => [];
}
