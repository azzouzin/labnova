class QuestionnaireModel {
  final String? reasonForVisit;
  final String? reasonForVisitOther;
  final List<String> currentSymptoms;
  final String? symptomDuration;
  final bool hasMedicalHistory;
  final List<String> medicalHistories;
  final bool isOnMedication;
  final String? currentMedications;
  final String? additionalObservations;
  final String? pregnancyStatus;

  QuestionnaireModel({
    required this.reasonForVisit,
    this.reasonForVisitOther,
    required this.currentSymptoms,
    required this.symptomDuration,
    required this.hasMedicalHistory,
    required this.medicalHistories,
    required this.isOnMedication,
    this.currentMedications,
    this.additionalObservations,
    this.pregnancyStatus,
  });

  factory QuestionnaireModel.fromJson(Map<String, dynamic> json) {
    return QuestionnaireModel(
      reasonForVisit: json['reasonForVisit'],
      reasonForVisitOther: json['reasonForVisitOther'],
      currentSymptoms: List<String>.from(json['currentSymptoms']),
      symptomDuration: json['symptomDuration'],
      hasMedicalHistory: json['hasMedicalHistory'],
      medicalHistories: List<String>.from(json['medicalHistories']),
      isOnMedication: json['isOnMedication'],
      currentMedications: json['currentMedications'],
      additionalObservations: json['additionalObservations'],
      pregnancyStatus: json['pregnancyStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reasonForVisit': reasonForVisit,
      'reasonForVisitOther': reasonForVisitOther,
      'currentSymptoms': currentSymptoms,
      'symptomDuration': symptomDuration,
      'hasMedicalHistory': hasMedicalHistory,
      'medicalHistories': medicalHistories,
      'isOnMedication': isOnMedication,
      'currentMedications': currentMedications,
      'additionalObservations': additionalObservations,
      'pregnancyStatus': pregnancyStatus,
    };
  }
}
