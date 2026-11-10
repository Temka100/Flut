import 'package:flutter/material.dart';
import '../models/antivirus.dart';

const List<Antivirus> antiviruses = [
  Antivirus(
    name: 'Kaspersky',
    description: 'Защита от вредоносных программ',
    image: 'assets/images/cybersecurity-icons_1.jpg',
    icon: Icons.security,
  ),
  Antivirus(
    name: 'Dr.Web',
    description: 'Антивирусная защита устройства',
    image: 'assets/images/cybersecurity-icons_2.jpg',
    icon: Icons.bug_report,
  ),
  Antivirus(
    name: '360 Total Security',
    description: 'Очистка и оптимизация системы',
    image: 'assets/images/cybersecurity-icons_3.jpg',
    icon: Icons.cleaning_services,
  ),
  Antivirus(
    name: 'Microsoft Defender',
    description: 'Защита Windows от угроз',
    image: 'assets/images/cybersecurity-icons_4.jpg',
    icon: Icons.computer,
  ),
  Antivirus(
    name: 'Comodo Cloud Antivirus',
    description: 'Облачный антивирус с песочницей',
    image: 'assets/images/cybersecurity-icons_5.jpg',
    icon: Icons.filter_drama,
  ),
];
