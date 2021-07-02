import 'package:flutter/material.dart';
import 'package:hhw/vedas_screens/atharv_ved.dart';
import 'package:hhw/vedas_screens/rig_ved.dart';
import 'package:hhw/vedas_screens/sama_ved.dart';
import 'package:hhw/vedas_screens/yajur_ved.dart';

class VedaMaterial {
  VedaMaterial({
    required this.imagePath,
    required this.backgroundImage,
    required this.info,
    required this.name,
    required this.page,
    required this.description,
    required this.color,
    required this.title,
  });
  final String imagePath;
  final String name;
  final Color color;
  final String description;
  final String info;
  final String backgroundImage;
  final Widget page;
  final String title;
}

List<VedaMaterial> vedaMaterialsList = [
  VedaMaterial(
      info: 'Binary Number System, Errors & Diagnosis, Pi(π), Creation and composition of Universe',
      color: Color(0xFF5EC4FF),
      description: '',
      backgroundImage: 'assets/rig.jpg',
      imagePath: 'assets/ved0.jpg',
      name: 'Rig\nVeda',
      title: 'Rig Veda',
      page: RigVedaScreen()),
  VedaMaterial(
      info:
          'Oldest concept of infinity was very well explained by the Yajur Veda',
      color: Color(0xFF730052),
      description: '',
      backgroundImage: 'assets/yajur.jpg',
      imagePath: 'assets/ved1.jpg',
      name: 'Yajur\nVeda',
      title: 'Yajur Veda',
      page: YajurVedaScreen()),
  VedaMaterial(
      info:
          'The hymns contained in this Veda explains the algorithms of Binary Number System in great detail',
      color: Color(0xFF4D70FF),
      description: '',
      backgroundImage: 'assets/saam.jpg',
      imagePath: 'assets/ved2.jpg',
      name: 'Sama\nVeda',
      title: 'Sama Veda',
      page: SamaVedaScreen()),
  VedaMaterial(
      info:
          'Concept of Shunya (Zero,void) and Concept of Infinity is explained in detail',
      color: Color(0xFFFF8B27),
      description: '',
      backgroundImage: 'assets/atharv.jpg',
      imagePath: 'assets/ved3.jpg',
      name: 'Atharva\nVeda',
      title: 'Atharva Veda',
      page: AtharvVedaScreen()),
];
