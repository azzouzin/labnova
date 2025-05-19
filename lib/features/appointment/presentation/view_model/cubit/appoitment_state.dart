part of 'appoitment_cubit.dart';

sealed class AppoitmentState extends Equatable {
  const AppoitmentState();

  @override
  List<Object> get props => [];
}

final class AppoitmentApproved extends AppoitmentState {}

final class AppoitmentRejected extends AppoitmentState {}
