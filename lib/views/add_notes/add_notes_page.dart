import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notegetxmysql/data/src/colors.dart';
import 'package:notegetxmysql/data/src/strings.dart';
import 'package:notegetxmysql/views/add_notes/add_notes_controller.dart';


class AddNotesPage extends GetWidget<AddNotesController> {
  const AddNotesPage({Key? key}) : super(key: key);

  static const String routeName = '/views/add_notes/add_notes_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addNoteAppBarText),
        backgroundColor: mainColor,
      ),
      body: _buildBody());

  }
  Widget _buildBody() {
    return Card(
      child: _buildTextField(),
    );
  }

  Widget _buildTextField() {
    return TextField();
  }
}