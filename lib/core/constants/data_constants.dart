import 'dart:developer';

import 'package:labnova/core/models/services.dart';

import '../models/labo.dart';

const etablissments = [
  LaboModel(
    id: 1,
    name: 'Sidi yassin (khayati maamer)',
    parameters: [
      'GLYCEMIE',
      'cholestérol',
      'triglycéride',
      'uree',
      'creatine',
      'FNS',
      'VS',
      'ASLO',
      'CRP',
      'Groupage sanguin'
    ],
  ),
  LaboModel(
    id: 2,
    name: 'Trig nadjah (mostapha ben boulaid)',
    parameters: ['HIV', 'HCV', 'Syphilis(test rapide)', 'Groupage sanguin'],
  ),
  LaboModel(
    id: 3,
    name: 'Centre ville (BOUROUMI ADK)',
    parameters: [
      'FNS',
      'GROUPAGE SANGUIN',
      'CREATININE',
      'UREE',
      'GLYCEMIE',
      'VS',
      'CHOLESTEROL',
      'TRIGLYCERIDE'
    ],
  ),
  LaboModel(
    id: 4,
    name: 'Ben hamouda (SAADALI BOUAMAMA)',
    parameters: ['CHOLESTEROLE TOTALE', 'GLYCEMIE', 'VS', 'UREE', 'CREATININE'],
  ),
  LaboModel(
    id: 5,
    name: 'Sidi el Djilali (ben mofak belabbes)',
    parameters: ['VS', 'GLYCEMIE', 'UREE', 'CREATININE', 'GLYCEMIE'],
  ),
  LaboModel(
    id: 6,
    name: 'Rochet (sghir Ahmed)',
    parameters: [
      'GLYCEMIE',
      'CHOLESTEROL',
      'TRIGLYCERIDE',
      'VS',
      'FNS',
      'GROUPAGE SANGUIN',
      'UREE',
      'CREATININE',
      'TGO',
      'TGP'
    ],
  ),
  LaboModel(
    id: 7,
    name: 'ADIM FATHA (ben zaama ben saber)',
    parameters: [
      'GLYCEMIE',
      'CHOLESTEROL TOTAL',
      'TRIGLYCERIDE',
      'UREE',
      'CREATININE',
      'FNS',
      'VS',
      'GROUPAGE SANGUIN'
    ],
  ),
  LaboModel(
    id: 8,
    name: 'Sorikor (Bouhssina najadi)',
    parameters: [
      'FNS',
      'VS',
      'GLYCEMIE',
      'UREE',
      'CREATININE',
      'CHOLESTEROL TOTALE',
      'GROUPAGE SANGUIN'
    ],
  ),
  LaboModel(
    id: 9,
    name: 'SITI MIMOUNE (blaasal mokhtar)',
    parameters: [],
  ),
  LaboModel(
    id: 10,
    name: 'Zawiya (SALIHA WALD KBAYLIYA)',
    parameters: [],
  ),
];

const List<ServicesModel> services = [
  ServicesModel(
    id: 1,
    name: 'Changement\nde Pansement',
    image: 'R1.png',
  ),
  ServicesModel(
    id: 2,
    name: 'Prélèvement\nà domicile',
    image: 'R2.png',
  ),
  ServicesModel(
    id: 3,
    name: 'Soins\nà domicile',
    image: 'R3.png',
  ),
];
