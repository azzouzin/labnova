import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:labnova/core/models/appointment.dart';

part 'appoitment_state.dart';

class AppoitmentCubit extends Cubit<AppoitmentState> {
  AppoitmentCubit() : super(AppoitmentRejected());

  void switchApproved() {
    state is AppoitmentApproved
        ? emit(AppoitmentRejected())
        : emit(AppoitmentApproved());
  }

  void addNewAppoitment(QuestionnaireModel appointment) async {
    emit(AppoitmentLoading());
    // Add appointment to Firestore
    try {
      await FirebaseFirestore.instance.collection('appointments').add(
        {
          'reasonForVisit': appointment.reasonForVisit,
          'currentSymptoms': appointment.currentSymptoms,
          'symptomDuration': appointment.symptomDuration,
          'hasMedicalHistory': appointment.hasMedicalHistory,
          'medicalHistories': appointment.medicalHistories,
          'isOnMedication': appointment.isOnMedication,
          'currentMedications': appointment.currentMedications,
          'additionalObservations': appointment.additionalObservations,
          'pregnancyStatus': appointment.pregnancyStatus,
          'laboName': appointment.laboName,
          'clientName': appointment.clientName,
          'timestamp': FieldValue.serverTimestamp(),
        },
      );
      emit(AppoitmentSeccess());
    } on Exception catch (e) {
      emit(AppoitmentError(e.toString()));
    }
  }
}
