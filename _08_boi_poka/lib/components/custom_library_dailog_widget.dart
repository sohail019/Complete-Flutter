import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_radio_widget.dart';
import 'package:_08_boi_poka/components/custom_textfield_widget.dart';
import 'package:_08_boi_poka/components/snackbar_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/books_controller.dart';
import 'package:_08_boi_poka/models/get_all_library_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomLibraryDialogWidget extends StatefulWidget {
  final Function(String libraryName, String libraryId) onSubmit;
  String type;
  bool isCreatingNew;

  CustomLibraryDialogWidget({
    this.type = "ADD_ITEM",
    required this.onSubmit,
    required this.isCreatingNew,
    super.key,
  });

  @override
  _CustomLibraryDialogWidgetState createState() =>
      _CustomLibraryDialogWidgetState();
}

class _CustomLibraryDialogWidgetState extends State<CustomLibraryDialogWidget> {
  final TextEditingController searchController = TextEditingController();
  String? selectedOption = 'createNew';

  // Sample JSON data
  List<Map<String, String>> dropdownItems = [];

  // Selected item for the dropdown
  String? selectedDropdownValue;

  @override
  void initState() {
    super.initState();
    // Add listener to searchController
    searchController.addListener(_onSearchTextChanged);
    if (widget.type == "ADD_ITEM") {
      initScreenData();
    }
  }

  void initScreenData() async {
    if (!widget.isCreatingNew) {
      BooksController booksController = BooksController();
      GetAllLibraryModel allLibraryModel =
          await booksController.getAllLibraries();
      if (allLibraryModel.data.isNotEmpty) {
        List<Library> allLib = allLibraryModel.data;
        if (allLib.isNotEmpty) {
          for (var item in allLib) {
            dropdownItems.add({'id': item.id, 'title': item.libraryName});
          }
        }
      }
    }
  }

  // This will be called whenever the text in the searchController changes
  void _onSearchTextChanged() {
    // You can perform any logic based on the text input here
    print('Search text: ${searchController.text}');
    // For example, you could update the UI or trigger other logic
  }

  @override
  void dispose() {
    // Dispose of the controller and listener to avoid memory leaks
    searchController.removeListener(_onSearchTextChanged); // Remove listener
    searchController.dispose(); // Dispose of the controller
    super.dispose();
  }

  // This will be called whenever the text in the searchController changes
  void onContinueClick(BuildContext context) {
    if (searchController.text.trim().isEmpty &&
        selectedDropdownValue.toString().trim().isEmpty) {
      SnackbarWidget(
        textToShow:
            (widget.type == "REGISTER")
                ? "Please create a library"
                : "Please create a library or select a library",
        durationInMilliseconds: 3000,
        context: context,
      );
      return;
    }

    if (selectedOption == "createNew" && searchController.text.trim().isEmpty) {
      SnackbarWidget(
        textToShow: "Please create a library to add book to it",
        durationInMilliseconds: 3000,
        context: context,
      );
      return;
    }
    if (selectedOption == "addExisting" &&
        selectedDropdownValue.toString().trim().isEmpty) {
      SnackbarWidget(
        textToShow: "Please select a library to add book to it",
        durationInMilliseconds: 3000,
        context: context,
      );
      return;
    }
    widget.onSubmit(
      selectedOption == "createNew" ? searchController.text.trim() : "",
      selectedOption == "addExisting" ? selectedDropdownValue.toString() : "",
    );
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (widget.type == "REGISTER")
                      ? "Create Library"
                      : "Create Library",
                  style: AppTypography.title20PrimaryTextBold,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.type != "REGISTER")
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomRadioWidget(
                            value: 'createNew',
                            selectedOption: selectedOption ?? '',
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                            label: 'Create New',
                          ),
                          SizedBox(width: 20.w),
                          CustomRadioWidget(
                            value: 'addExisting',
                            selectedOption: selectedOption ?? '',
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                            label: 'Add Existing',
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                if (selectedOption == 'createNew')
                  CustomTextfield(
                    controller: searchController,
                    onChangeCallback: () {
                      // You could also trigger actions in this callback, if needed
                    },
                    title: "Library Name",
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ],
                    // isOnlyNumeric: true,
                  ),
                if (selectedOption == 'addExisting')
                  Container(
                    width: double.infinity,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: DropdownButton2<String>(
                        dropdownStyleData: const DropdownStyleData(
                          offset: Offset(5, -15),
                        ),
                        isExpanded: true,
                        value: selectedDropdownValue,
                        hint: Text(
                          'Select Existing Item',
                          style: AppTypography.typo12PrimaryTextRegular,
                        ),
                        onChanged:
                            (String? newValue) => setState(() {
                              selectedDropdownValue = newValue;
                            }),
                        underline: SizedBox.shrink(),
                        items:
                            dropdownItems.map((item) {
                              return DropdownMenuItem<String>(
                                value: item['title'],
                                child: Text(
                                  item['title']!,
                                  style: AppTypography.typo10PrimaryTextRegular,
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdaptiveButtonWidget(
                iconImg: AppImages.moreIconHorizontal,
                disabled: false,
                onTap: () => Navigator.pop(context),
                title: "Cancel",
              ),
              AdaptiveButtonWidget(
                iconImg: AppImages.nextIcon,
                disabled: false,
                onTap: () => onContinueClick(context),
                title: "Continue",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
