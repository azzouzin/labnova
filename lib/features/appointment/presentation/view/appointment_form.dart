// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:labnova/core/models/appointment.dart';
import 'package:labnova/core/models/labo.dart';
import 'package:labnova/core/models/user.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../core/constants/assets_const.dart';

class AppointmentFrom extends StatefulWidget {
  LaboModel laboModel;
  AppointmentFrom({
    Key? key,
    required this.laboModel,
  }) : super(key: key);
  @override
  _AppointmentFromState createState() => _AppointmentFromState();
}

class _AppointmentFromState extends State<AppointmentFrom> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? reasonForVisit;
  List<String> currentSymptoms = [];
  String? symptomDuration;
  bool hasMedicalHistory = false;
  List<String> medicalHistories = [];
  bool isOnMedication = false;
  String? currentMedications;
  String? additionalObservations;
  String? pregnancyStatus;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Handle form submission (e.g., send data to server or display summary)
      print('Reason for Visit: $reasonForVisit');
      print('Current Symptoms: $currentSymptoms');
      print('Symptom Duration: $symptomDuration');
      print('Has Medical History: $hasMedicalHistory');
      print('Medical Histories: $medicalHistories');
      print('Is on Medication: $isOnMedication');
      print('Current Medications: $currentMedications');
      print('Additional Observations: $additionalObservations');
      print('Pregnancy Status: $pregnancyStatus');
      print('User: ${await BlocProvider.of<AuthCubit>(context).getUserName()}');

      final QuestionnaireModel appointment = QuestionnaireModel(
        reasonForVisit: reasonForVisit,
        currentSymptoms: currentSymptoms,
        symptomDuration: symptomDuration,
        hasMedicalHistory: hasMedicalHistory,
        medicalHistories: medicalHistories,
        isOnMedication: isOnMedication,
        currentMedications: currentMedications,
        additionalObservations: additionalObservations,
        pregnancyStatus: pregnancyStatus,
        laboName: widget.laboModel.name,
        clientName:
            BlocProvider.of<AuthCubit>(context).userModel?.name ?? "Null",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Medical Questionnaire'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsData.kmainBG,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Raison de la visite',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...[
                  'Contrôle de routine',
                  'Symptômes récents',
                  'Demande de suivi médical',
                  'Prescription d’un médecin',
                ].map((option) => Row(
                      children: [
                        Radio<String>(
                          value: option,
                          groupValue: reasonForVisit,
                          onChanged: (value) {
                            setState(() {
                              reasonForVisit = value;
                            });
                          },
                        ),
                        Text(option),
                      ],
                    )),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Autre',
                      groupValue: reasonForVisit,
                      onChanged: (value) {
                        setState(() {
                          reasonForVisit = value;
                        });
                      },
                    ),
                    Text('Autre:'),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        enabled: reasonForVisit == 'Autre',
                        decoration: InputDecoration(
                          hintText: 'Veuillez préciser',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Symptômes actuels',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    'Fièvre',
                    'Fatigue',
                    'Douleurs abdominales',
                    'Perte de poids',
                    'Vertiges',
                    'Aucun symptôme',
                  ]
                      .map((symptom) => FilterChip(
                            label: Text(symptom),
                            selected: currentSymptoms.contains(symptom),
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  currentSymptoms.add(symptom);
                                } else {
                                  currentSymptoms.remove(symptom);
                                }
                              });
                            },
                          ))
                      .toList(),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Autre (veuillez préciser)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (!currentSymptoms.contains(value)) {
                        currentSymptoms.add(value);
                      }
                    });
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Depuis combien de temps ressentez-vous cela?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...[
                  'Moins d’un jour',
                  '1 à 3 jours',
                  'Plus de 3 jours',
                ].map((option) => Row(
                      children: [
                        Radio<String>(
                          value: option,
                          groupValue: symptomDuration,
                          onChanged: (value) {
                            setState(() {
                              symptomDuration = value;
                            });
                          },
                        ),
                        Text(option),
                      ],
                    )),
                SizedBox(height: 16),
                Text(
                  'Antécédents médicaux',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            'Avez-vous des antécédents médicaux importants?')),
                    SizedBox(width: 8),
                    Switch(
                      value: hasMedicalHistory,
                      onChanged: (value) {
                        setState(() {
                          hasMedicalHistory = value;
                        });
                      },
                    ),
                  ],
                ),
                if (hasMedicalHistory)
                  Wrap(
                    spacing: 8,
                    children: [
                      'Diabète',
                      'Hypertension',
                      'Maladie cardiaque',
                      'Allergies',
                      'Maladies infectieuses récentes',
                    ]
                        .map((condition) => FilterChip(
                              label: Text(condition),
                              selected: medicalHistories.contains(condition),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    medicalHistories.add(condition);
                                  } else {
                                    medicalHistories.remove(condition);
                                  }
                                });
                              },
                            ))
                        .toList(),
                  ),
                if (hasMedicalHistory)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Autre (veuillez préciser)',
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (!medicalHistories.contains(value)) {
                          medicalHistories.add(value);
                        }
                      });
                    },
                  ),
                SizedBox(height: 16),
                Text(
                  'Traitement en cours',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            Text('Prenez-vous actuellement des médicaments?')),
                    SizedBox(width: 8),
                    Switch(
                      value: isOnMedication,
                      onChanged: (value) {
                        setState(() {
                          isOnMedication = value;
                        });
                      },
                    ),
                  ],
                ),
                if (isOnMedication)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Merci de les nommer',
                    ),
                    onChanged: (value) {
                      setState(() {
                        currentMedications = value;
                      });
                    },
                  ),
                SizedBox(height: 16),
                Text(
                  'Observations complémentaires',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Y a-t-il des choses importantes ?',
                  ),
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      additionalObservations = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Informations complémentaires',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text('Êtes-vous enceinte? (pour les femmes)')),
                    SizedBox(width: 8),
                    DropdownButton<String>(
                      value: pregnancyStatus,
                      hint: Text('Sélectionnez'),
                      items: [
                        DropdownMenuItem(value: 'Oui', child: Text('Oui')),
                        DropdownMenuItem(value: 'Non', child: Text('Non')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          pregnancyStatus = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 24),
                CustomButton(onPressed: _submitForm, text: 'Soumettre'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
