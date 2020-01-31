

import 'package:application_paper/topic/hasApplication.dart';
import 'package:application_paper/topic/notApplication.dart';
import 'package:flutter/material.dart';

class ApplicationController extends StatefulWidget {

  String hasApplication = "";

  String id = "";

  ApplicationController({this.hasApplication, this.id});

  @override
  _ApplicationControllerState createState() => _ApplicationControllerState(hasApplication: this.hasApplication, id: this.id);
}

class _ApplicationControllerState extends State<ApplicationController> {

  String hasApplication = "";

  String id = "";

  _ApplicationControllerState({this.hasApplication, this.id});

  @override
  Widget build(BuildContext context) {
    if (hasApplication == "1") {
      return HasApplication();
    } else {
      return NotApplication(id: this.id,);
    }
  }
}


