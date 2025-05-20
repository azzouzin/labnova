part of 'appoitment_cubit.dart';

sealed class AppoitmentState extends Equatable {
  const AppoitmentState();

  @override
  List<Object> get props => [];
}

final class AppoitmentApproved extends AppoitmentState {}

final class AppoitmentRejected extends AppoitmentState {}

final class AppoitmentLoading extends AppoitmentState {}

final class AppoitmentSeccess extends AppoitmentState {}

final class AppoitmentError extends AppoitmentState {
  final String message;
  const AppoitmentError(this.message);
}
