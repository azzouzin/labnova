import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appoitment_state.dart';

class AppoitmentCubit extends Cubit<AppoitmentState> {
  AppoitmentCubit() : super(AppoitmentRejected());

  void switchApproved() {
    state is AppoitmentApproved
        ? emit(AppoitmentRejected())
        : emit(AppoitmentApproved());
  }
}
