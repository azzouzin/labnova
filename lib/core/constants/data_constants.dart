import 'dart:developer';

import 'package:labnova/core/models/services.dart';

import '../models/condition.dart';
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

final conditions = [
  ConditionModel(
    test: 'FNS',
    instructions: [
      "Pas de jeûne nécessaire",
      "Éviter les excès alimentaires dans les 24 heures précédant le prélèvement"
    ],
  ),
  ConditionModel(
    test: 'Bilan glycémique',
    instructions: [
      "Jeûne obligatoire (8 à 12 heures)",
      "Ne pas manger ni boire (sauf de l’eau) pendant cette période",
      "Éviter les boissons sucrées et les jus dans les 24h précédentes",
      "Test réalisé le matin après une nuit de jeûne"
    ],
  ),
  ConditionModel(
    test: 'Urée/créatinine',
    instructions: [
      "Pas de jeûne strict sauf si combiné à d'autres analyses",
      "Hydratation normale avant le prélèvement",
      "Éviter excès ou restriction de liquides",
      "Éviter repas riches en protéines 24h avant",
      "Signaler déshydratation ou maladie récente",
      "Prélèvement souvent le matin"
    ],
  ),
  ConditionModel(
    test: 'ASAT/ALAT (TGO/TGP)',
    instructions: [
      "Jeûne recommandé (8 à 12 heures)",
      "Jeûne obligatoire si bilan lipidique en même temps",
      "Éviter repas gras",
      "Prélèvement souvent le matin"
    ],
  ),
  ConditionModel(
    test: 'Cholestérol total',
    instructions: [
      "Jeûne obligatoire (12 heures)",
      "Ne pas manger/boire sauf eau",
      "Alimentation normale avant test",
      "Ne pas modifier le régime sauf indication médicale",
      "Prélèvement généralement le matin"
    ],
  ),
  ConditionModel(
    test: 'LDL / HDL',
    instructions: [
      "Jeûne obligatoire (12 heures)",
      "Éviter excès alimentaires",
      "Pas de régime sauf indication médicale",
      "Prélèvement idéalement le matin"
    ],
  ),
  ConditionModel(
    test: 'VS',
    instructions: [
      "Pas de jeûne nécessaire sauf analyses associées",
      "Bien s’hydrater sauf si jeûne requis",
      "Prélèvement de préférence le matin"
    ],
  ),
  ConditionModel(
    test: 'CRP',
    instructions: [
      "Pas de jeûne requis sauf autres analyses",
      "Boire de l’eau sauf si jeûne nécessaire"
    ],
  ),
  ConditionModel(
    test: 'TP/TCK/Fibrinogène',
    instructions: [
      "Pas de jeûne requis sauf autres analyses",
      "Signaler troubles de la coagulation ou symptômes",
      "Prélèvement souvent le matin"
    ],
  ),
  ConditionModel(
    test: 'TSH / T3 / T4',
    instructions: [
      "Pas de jeûne requis sauf autres analyses",
      "Éviter produits riches en iode",
      "Signaler prises de produits iodés",
      "Prélèvement idéalement le matin"
    ],
  ),
  ConditionModel(
    test: 'HbA1c',
    instructions: [
      "Aucune préparation requise",
      "Peut être fait à tout moment de la journée"
    ],
  ),
];
