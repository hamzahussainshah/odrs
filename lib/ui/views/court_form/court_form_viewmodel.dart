import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:file_picker/file_picker.dart';

class CourtFormViewModel extends BaseViewModel {
  // Text Controllers
  final TextEditingController courtCaseNumberController = TextEditingController();
  final TextEditingController odrIdController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateOfReferralController = TextEditingController();
  final TextEditingController closingDateController = TextEditingController();
  final TextEditingController additionalNotesController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  // Initiating Party A fields
  final initiatingPartyAFirstNameController = TextEditingController();
  final initiatingPartyAMiddleNameController = TextEditingController();
  final initiatingPartyALastNameController = TextEditingController();
  TextEditingController nationalityPartyAController =TextEditingController();

  List<String> initiatingPartyATitleOptions = ['Mr.', 'Ms.', 'Mrs.', 'Dr.'];
  String? get selectedInitiatingPartyATitle => _selectedInitiatingPartyATitle;
  void setSelectedInitiatingPartyATitle(String value) {
    _selectedInitiatingPartyATitle = value;
    notifyListeners();
  }
  // Add these to your CourtFormViewModel class

  final initiatingPartyAPassportController = TextEditingController();
  final initiatingPartyAPhoneController = TextEditingController();
  final initiatingPartyACountryCodeController = TextEditingController();
  final initiatingPartyAMobileController = TextEditingController();
  final initiatingPartyAMobileCountryCodeController = TextEditingController();
  final initiatingPartyAWhatsappController = TextEditingController();
  final initiatingPartyAWhatsappCountryCodeController = TextEditingController();
  final initiatingPartyAEmailController = TextEditingController();
  final initiatingPartyAAlternateEmailController = TextEditingController();

  // Dropdown Values
  String? _selectedNatureOfDispute;
  String? _selectedMediator;
  String? _selectedTitle;
  String? _selectedCourtName;
  String? _selectedJurisdiction;
  String? _selectedInitiatingPartyType;
  String? _selectedInitiatingPartyATitle;

  CourtFormViewModel(){
    _selectedNatureOfDispute = natureOfDisputeOptions.first;
    _selectedMediator = mediatorOptions.first;
    _selectedTitle = titleOptions.first;
    _selectedCourtName = courtNameOptions.first;
    _selectedJurisdiction = jurisdictionOptions.first;
    _selectedInitiatingPartyATitle = initiatingPartyATitleOptions.first;

    notifyListeners();
  }
  // Selected Files
  List<PlatformFile> _selectedFiles = [];
  // In CourtFormViewModel
  bool isCurrentAddressChecked = false;
  bool isPermanentAddressChecked = false;

  void setCurrentAddressChecked(bool value) {
    isCurrentAddressChecked = value;
    notifyListeners();
  }

  void setPermanentAddressChecked(bool value) {
    isPermanentAddressChecked = value;
    notifyListeners();
  }

  // Dropdown Options
  final List<String> natureOfDisputeOptions = [
    'None',
    'Contract Dispute',
    'Family Law',
    'Property Dispute',
    'Other'
  ];

  final List<String> mediatorOptions = [
    'None'
  ];

  final List<String> titleOptions = [
    'Mr',
    'Ms',
    'Dr'
  ];

  final List<String> courtNameOptions = [
    'District Court'
  ];

  final List<String> jurisdictionOptions = [
    'None',
    'Islamabad'
  ];
  final List<String> initiatingPartyType = [
    'Individual',
    'Company',
  ];



  // Getters
  String? get selectedNatureOfDispute => _selectedNatureOfDispute;
  String? get selectedMediator => _selectedMediator;
  String? get selectedTitle => _selectedTitle;
  String? get selectedCourtName => _selectedCourtName;
  String? get selectedJurisdiction => _selectedJurisdiction;
  List<PlatformFile> get selectedFiles => _selectedFiles;
  String? get selectedInitiatingPartyType => _selectedInitiatingPartyType;

  // Setters
  void setSelectedNatureOfDispute(String value) {
    _selectedNatureOfDispute = value;
    notifyListeners();
  }

  void setSelectedMediator(String value) {
    _selectedMediator = value;
    notifyListeners();
  }

  void setSelectedTitle(String value) {
    _selectedTitle = value;
    notifyListeners();
  }

  void setSelectedCourtName(String value) {
    _selectedCourtName = value;
    notifyListeners();
  }

  void setSelectedJurisdiction(String value) {
    _selectedJurisdiction = value;
    notifyListeners();
  }
  void setSelectedInitiatingPartyType(String value) {
    _selectedInitiatingPartyType = value;
    notifyListeners();
  }

  // Date Selection
  Future<void> selectDate(BuildContext context, {bool isClosingDate = false}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              surface: Theme.of(context).colorScheme.surface,
              onSurface: Theme.of(context).colorScheme.onSurface,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formattedDate = "${picked.day}/${picked.month}/${picked.year}";
      if (isClosingDate) {
        closingDateController.text = formattedDate;
      } else {
        dateOfReferralController.text = formattedDate;
      }
      notifyListeners();
    }
  }

  // File Selection
  Future<void> selectFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
        allowedExtensions: null,
      );

      if (result != null) {
        _selectedFiles = result.files;
        notifyListeners();
      }
    } catch (e) {
      print('Error selecting files: $e');
    }
  }

  // Remove selected file
  void removeFile(int index) {
    if (index >= 0 && index < _selectedFiles.length) {
      _selectedFiles.removeAt(index);
      notifyListeners();
    }
  }

  // Clear all files
  void clearFiles() {
    _selectedFiles.clear();
    notifyListeners();
  }

  // Form validation
  bool get isFormValid {
    return courtCaseNumberController.text.isNotEmpty &&
        odrIdController.text.isNotEmpty &&
        titleController.text.isNotEmpty &&
        dateOfReferralController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  // Submit form
  Future<void> submitForm() async {
    if (!isFormValid) {
      // Show validation error
      return;
    }

    setBusy(true);

    try {
      // Implement your form submission logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      // Clear form after successful submission
      clearForm();

    } catch (e) {
      print('Error submitting form: $e');
    } finally {
      setBusy(false);
    }
  }



  // Clear form
  void clearForm() {
    courtCaseNumberController.clear();
    odrIdController.clear();
    titleController.clear();
    dateOfReferralController.clear();
    closingDateController.clear();
    additionalNotesController.clear();
    firstNameController.clear();
    lastNameController.clear();
    middleNameController.clear();

    _selectedNatureOfDispute = natureOfDisputeOptions.first;
    _selectedMediator = mediatorOptions.first;
    _selectedTitle = titleOptions.first;
    _selectedCourtName = courtNameOptions.first;
    _selectedJurisdiction = jurisdictionOptions.first;

    _selectedFiles.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    courtCaseNumberController.dispose();
    odrIdController.dispose();
    titleController.dispose();
    dateOfReferralController.dispose();
    closingDateController.dispose();
    additionalNotesController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    initiatingPartyAPassportController.dispose();
    initiatingPartyAPhoneController.dispose();
    initiatingPartyACountryCodeController.dispose();
    initiatingPartyAMobileController.dispose();
    initiatingPartyAMobileCountryCodeController.dispose();
    initiatingPartyAWhatsappController.dispose();
    initiatingPartyAWhatsappCountryCodeController.dispose();
    initiatingPartyAEmailController.dispose();
    initiatingPartyAAlternateEmailController.dispose();
    super.dispose();
  }
}