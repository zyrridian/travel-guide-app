import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide_app/core/models/destination.dart';
import 'package:travel_guide_app/core/repositories/destination_repository.dart';

// Events
abstract class DestinationEvent {}

class LoadDestinationEvent extends DestinationEvent {}

// States
abstract class DestinationState {}

class DestinationLoadingState extends DestinationState {}

class DestinationLoadedState extends DestinationState {
  final List<Destination> destinations;

  DestinationLoadedState(this.destinations);
}

class DestinationErrorState extends DestinationState {
  final String error;

  DestinationErrorState(this.error);
}

// BLoC
class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  final DestinationRepository destinationRepository;

  DestinationBloc(this.destinationRepository) : super(DestinationLoadingState());

  @override
  Stream<DestinationState> mapEventToState(DestinationEvent event) async* {
    if (event is LoadDestinationEvent) {
      yield DestinationLoadingState();
      try {
        final destinations = await destinationRepository.fetchDestinations();
        yield DestinationLoadedState(destinations);
      } catch (e) {
        yield DestinationErrorState(e.toString());
      }
    }
  }
  
}