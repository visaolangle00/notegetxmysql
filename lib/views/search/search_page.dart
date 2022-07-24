
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:notegetxmysql/data/src/colors.dart';
import 'package:notegetxmysql/data/src/strings.dart';
import 'package:notegetxmysql/views/search/search_controller.dart';

class SearchPage extends GetWidget<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  static const String routeName = '/views/search/search_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(searchAppBarText),
        backgroundColor: mainColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Flexible(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              _buildSearchName(),
              SizedBox(height: 30),
              _buildNoItemCard(),
              _buildSearchedName(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 10,
    );
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }

  Widget _buildNoItemCard() {
    return Obx(() => controller.isNoResultFound.value && controller.isnoteNameNotEmpty.value
        ? Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNoItemColumn(),
            _buildSpace(),
            _buildNoItemImage(),
          ],
        ),
      ),
    )
        : const SizedBox());
  }

  Widget _buildNoItemColumn() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNoItemTitle(),
          _buildSpace(),
          _buildNoItemDescription(),
        ],
      ),
    );
  }

  Widget _buildNoItemTitle() {
    return Text(
      '',
    );
  }

  Widget _buildNoItemDescription() {
    return Text(
      '',
    );
  }

  Widget _buildNoItemImage() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.pink,
        shape: BoxShape.circle,
      ),
      child: Padding(padding: const EdgeInsets.all(10), child: CircleAvatar()),
    );
  }

  Widget _buildSearchName() {
    return _buildSearchNameTextField(
      controller.namesTextController,
      // _nameFocusNode,
      '',
    );
  }

  Widget _buildSearchNameTextField(
      TextEditingController textFieldValidatorController,
      //FocusNode focusNode,
      String hintText,
      ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: textFieldValidatorController,
      decoration: InputDecoration(
        hintText: hintText,
        //  false,
        suffixIcon: IconButton(
          // icon: SvgPicture.asset(
          //   Img.icSearch,
          //   height: 26,
          //   width: 26,

          // ),
          icon: Icon(Icons.ac_unit),
          onPressed: () {
            //  _nameFocusNode.unfocus();
            controller.search(controller.namesTextController.text);
          },
        ),
      ),
      onFieldSubmitted: (String typedName) {
        // _nameFocusNode.unfocus();

        if (typedName.length <= _availableSearchLetterValue) {
          controller.search(typedName);
        }
      },
      onChanged: (String typedName) {
        if (typedName.length > _availableSearchLetterValue) {
          controller.search(typedName);
        }
        controller.onNamesChanged(typedName);
      },
    );
  }

  Widget _buildSearchedName() {
    return Obx(() => controller.isnoteNameNotEmpty.value
        ? ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.noteNameList.length,
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        return _buildNamesColumn(index);
      },
    )
        : const SizedBox());
  }

  Widget _buildNamesColumn(int index) {
    return Obx(() => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            controller.onNamesSelected(index);
          },
          child: _buildAnimatedNamesContainer(
            index,
            controller.selectedIndex.value,
          ),
        ),
        _buildSpace(),
      ],
    ));
  }

  Widget _buildAnimatedNamesContainer(int index, int selectedIndex) {
    return AnimatedContainer(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      duration: const Duration(milliseconds: _animationDuration),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.noteNameList[index].toString(),
            ),
          ],
        ),
      ),
    );
  }
}

const int _animationDuration = 400;
const int _availableSearchLetterValue = 2;