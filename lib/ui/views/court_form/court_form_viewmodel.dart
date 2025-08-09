import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CourtFormViewModel extends BaseViewModel {
  // Basic form controllers
  final TextEditingController courtCaseNumberController = TextEditingController();
  final TextEditingController odrIdController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateOfReferralController = TextEditingController();
  final TextEditingController closingDateController = TextEditingController();

  // Referred By controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // Dropdown options
  final List<String> natureOfDisputeOptions = ['Contract Dispute', 'Property Dispute', 'Family Matter', 'Commercial Dispute'];
  final List<String> mediatorOptions = ['John Doe', 'Jane Smith', 'Robert Brown'];
  final List<String> titleOptions = ['Mr.', 'Mrs.', 'Ms.', 'Dr.', 'Prof.'];
  final List<String> courtNameOptions = ['Supreme Court', 'High Court', 'District Court'];
  final List<String> jurisdictionOptions = ['Federal', 'State', 'Local'];
  final List<String> initiatingPartyType = ['Individual', 'Corporation', 'Government'];
  final List<String> initiatingPartyATitleOptions = ['Mr.', 'Mrs.', 'Ms.', 'Dr.', 'Prof.'];

  // Selected values
  String? selectedNatureOfDispute;
  String? selectedMediator;
  String? selectedTitle;
  String? selectedCourtName;
  String? selectedJurisdiction;
  String? selectedInitiatingPartyType;
  String? selectedPartyTypeToAdd;

  // Dynamic Lists for parties
  List<String> initiatingParties = [];
  List<String> respondingParties = [];

  // Maps to store party data
  Map<String, Map<String, dynamic>> initiatingPartiesData = {};
  Map<String, Map<String, dynamic>> respondingPartiesData = {};

  // Legal Council Maps
  Map<String, Map<String, dynamic>> initiatingPartyLegalCouncils = {};
  Map<String, Map<String, dynamic>> respondingPartyLegalCouncils = {};

  // File handling
  List<dynamic> selectedFiles = [];

 CourtFormViewModel(){
   addNewParty(isInitialSetup: true);
 }

  // Party Management Methods
  void addNewParty({bool isInitialSetup = false}) {
    if (selectedPartyTypeToAdd == null && !isInitialSetup) return;

    String partyId = DateTime.now().millisecondsSinceEpoch.toString();

    if (isInitialSetup || selectedPartyTypeToAdd == "Initiating Party") {
      initiatingParties.add(partyId);
      initiatingPartiesData[partyId] = _createPartyData();
    } else if (selectedPartyTypeToAdd == "Responding Party") {
      respondingParties.add(partyId);
      respondingPartiesData[partyId] = _createPartyData();
    }

    if (!isInitialSetup) {
      selectedPartyTypeToAdd = null;
    }
    notifyListeners();
  }

  void removeInitiatingParty(String partyId, int index) {
    initiatingParties.removeAt(index);
    initiatingPartiesData.remove(partyId);
    initiatingPartyLegalCouncils.remove(partyId);
    notifyListeners();
  }

  void removeRespondingParty(String partyId, int index) {
    respondingParties.removeAt(index);
    respondingPartiesData.remove(partyId);
    respondingPartyLegalCouncils.remove(partyId);
    notifyListeners();
  }

  // Legal Council Management
  void addLegalCouncilForInitiatingParty(String partyId) {
    initiatingPartyLegalCouncils[partyId] = _createLegalCouncilData();
    notifyListeners();
  }

  void removeLegalCouncilForInitiatingParty(String partyId) {
    initiatingPartyLegalCouncils.remove(partyId);
    notifyListeners();
  }

  void addLegalCouncilForRespondingParty(String partyId) {
    respondingPartyLegalCouncils[partyId] = _createLegalCouncilData();
    notifyListeners();
  }

  void removeLegalCouncilForRespondingParty(String partyId) {
    respondingPartyLegalCouncils.remove(partyId);
    notifyListeners();
  }

  // Data Creation Methods
  Map<String, dynamic> _createPartyData() {
    return {
      'selectedTitle': null,
      'firstNameController': TextEditingController(),
      'middleNameController': TextEditingController(),
      'lastNameController': TextEditingController(),
      'nationalityController': TextEditingController(),
      'passportController': TextEditingController(),
      'phoneController': TextEditingController(),
      'phoneCountryCodeController': TextEditingController(),
      'mobileController': TextEditingController(),
      'mobileCountryCodeController': TextEditingController(),
      'whatsappController': TextEditingController(),
      'whatsappCountryCodeController': TextEditingController(),
      'emailController': TextEditingController(),
      'alternateEmailController': TextEditingController(),
      'isCurrentAddressChecked': false,
      'isPermanentAddressChecked': false,
      // Address data
      'currentAddress': _createAddressData(),
      'permanentAddress': _createAddressData(),
    };
  }

  Map<String, dynamic> _createLegalCouncilData() {
    return {
      'selectedTitle': null,
      'firstNameController': TextEditingController(),
      'middleNameController': TextEditingController(),
      'lastNameController': TextEditingController(),
      'emailController': TextEditingController(),
      'phoneController': TextEditingController(),
      'phoneCountryCodeController': TextEditingController(),
      'isCurrentAddressChecked': false,
      'isPermanentAddressChecked': false,
      // Address data
      'currentAddress': _createAddressData(),
      'permanentAddress': _createAddressData(),
    };
  }

  Map<String, dynamic> _createAddressData() {
    return {
      'streetAddressController': TextEditingController(),
      'appartmentController': TextEditingController(),
      'postalCodeController': TextEditingController(),
      'selectedCountry': null,
      'selectedState': null,
      'selectedCity': null,
    };
  }

  // Data Getter Methods
  Map<String, dynamic> getInitiatingPartyData(String partyId) {
    return initiatingPartiesData[partyId] ?? {};
  }

  Map<String, dynamic> getRespondingPartyData(String partyId) {
    return respondingPartiesData[partyId] ?? {};
  }

  Map<String, dynamic> getInitiatingPartyLegalCouncilData(String partyId) {
    return initiatingPartyLegalCouncils[partyId] ?? {};
  }

  Map<String, dynamic> getRespondingPartyLegalCouncilData(String partyId) {
    return respondingPartyLegalCouncils[partyId] ?? {};
  }

  Map<String, dynamic> getInitiatingPartyAddressData(String partyId, bool isPermanent) {
    final partyData = initiatingPartiesData[partyId] ?? {};
    return isPermanent ? partyData['permanentAddress'] ?? {} : partyData['currentAddress'] ?? {};
  }

  Map<String, dynamic> getRespondingPartyAddressData(String partyId, bool isPermanent) {
    final partyData = respondingPartiesData[partyId] ?? {};
    return isPermanent ? partyData['permanentAddress'] ?? {} : partyData['currentAddress'] ?? {};
  }

  Map<String, dynamic> getInitiatingPartyLegalCouncilAddressData(String partyId, bool isPermanent) {
    final legalCouncilData = initiatingPartyLegalCouncils[partyId] ?? {};
    return isPermanent ? legalCouncilData['permanentAddress'] ?? {} : legalCouncilData['currentAddress'] ?? {};
  }

  Map<String, dynamic> getRespondingPartyLegalCouncilAddressData(String partyId, bool isPermanent) {
    final legalCouncilData = respondingPartyLegalCouncils[partyId] ?? {};
    return isPermanent ? legalCouncilData['permanentAddress'] ?? {} : legalCouncilData['currentAddress'] ?? {};
  }

  // Data Setter Methods
  void setInitiatingPartyData(String partyId, String key, dynamic value) {
    if (initiatingPartiesData.containsKey(partyId)) {
      initiatingPartiesData[partyId]![key] = value;
      notifyListeners();
    }
  }

  void setRespondingPartyData(String partyId, String key, dynamic value) {
    if (respondingPartiesData.containsKey(partyId)) {
      respondingPartiesData[partyId]![key] = value;
      notifyListeners();
    }
  }

  void setInitiatingPartyLegalCouncilData(String partyId, String key, dynamic value) {
    if (initiatingPartyLegalCouncils.containsKey(partyId)) {
      initiatingPartyLegalCouncils[partyId]![key] = value;
      notifyListeners();
    }
  }

  void setRespondingPartyLegalCouncilData(String partyId, String key, dynamic value) {
    if (respondingPartyLegalCouncils.containsKey(partyId)) {
      respondingPartyLegalCouncils[partyId]![key] = value;
      notifyListeners();
    }
  }

  void setInitiatingPartyAddressData(String partyId, bool isPermanent, String key, dynamic value) {
    if (initiatingPartiesData.containsKey(partyId)) {
      final addressKey = isPermanent ? 'permanentAddress' : 'currentAddress';
      initiatingPartiesData[partyId]![addressKey][key] = value;
      notifyListeners();
    }
  }

  void setRespondingPartyAddressData(String partyId, bool isPermanent, String key, dynamic value) {
    if (respondingPartiesData.containsKey(partyId)) {
      final addressKey = isPermanent ? 'permanentAddress' : 'currentAddress';
      respondingPartiesData[partyId]![addressKey][key] = value;
      notifyListeners();
    }
  }

  void setInitiatingPartyLegalCouncilAddressData(String partyId, bool isPermanent, String key, dynamic value) {
    if (initiatingPartyLegalCouncils.containsKey(partyId)) {
      final addressKey = isPermanent ? 'permanentAddress' : 'currentAddress';
      initiatingPartyLegalCouncils[partyId]![addressKey][key] = value;
      notifyListeners();
    }
  }

  void setRespondingPartyLegalCouncilAddressData(String partyId, bool isPermanent, String key, dynamic value) {
    if (respondingPartyLegalCouncils.containsKey(partyId)) {
      final addressKey = isPermanent ? 'permanentAddress' : 'currentAddress';
      respondingPartyLegalCouncils[partyId]![addressKey][key] = value;
      notifyListeners();
    }
  }

  // Dropdown Setters
  void setSelectedNatureOfDispute(String value) {
    selectedNatureOfDispute = value;
    notifyListeners();
  }

  void setSelectedMediator(String value) {
    selectedMediator = value;
    notifyListeners();
  }

  void setSelectedTitle(String value) {
    selectedTitle = value;
    notifyListeners();
  }

  void setSelectedCourtName(String value) {
    selectedCourtName = value;
    notifyListeners();
  }

  void setSelectedJurisdiction(String value) {
    selectedJurisdiction = value;
    notifyListeners();
  }

  void setSelectedInitiatingPartyType(String value) {
    selectedInitiatingPartyType = value;
    notifyListeners();
  }

  void setSelectedPartyTypeToAdd(String value) {
    selectedPartyTypeToAdd = value;
    notifyListeners();
  }

  // Legacy methods for compatibility (you may need to update these based on your existing code)
  void setSelectedInitiatingPartyATitle(String value) {
    // This method might need to be updated based on which party you're referring to
    notifyListeners();
  }

  void setSelectedPartyACountry(String value) {
    // Update based on current context
    notifyListeners();
  }

  void setSelectedPartyAState(String value) {
    // Update based on current context
    notifyListeners();
  }

  void setSelectedPartyACity(String value) {
    // Update based on current context
    notifyListeners();
  }

  void setCurrentAddressChecked(bool value) {
    // Update based on current context - you'll need to track which party is being modified
    notifyListeners();
  }

  void setPermanentAddressChecked(bool value) {
    // Update based on current context - you'll need to track which party is being modified
    notifyListeners();
  }

  // Legacy properties for backward compatibility
  bool get isCurrentAddressChecked => false; // Update based on current context
  bool get isPermanentAddressChecked => false; // Update based on current context

  // Legacy controllers - these should be removed and replaced with dynamic ones
  final TextEditingController initiatingPartyAFirstNameController = TextEditingController();
  final TextEditingController initiatingPartyAMiddleNameController = TextEditingController();
  final TextEditingController initiatingPartyALastNameController = TextEditingController();
  final TextEditingController nationalityPartyAController = TextEditingController();
  final TextEditingController initiatingPartyAPassportController = TextEditingController();
  final TextEditingController initiatingPartyAPhoneController = TextEditingController();
  final TextEditingController initiatingPartyACountryCodeController = TextEditingController();
  final TextEditingController initiatingPartyAMobileController = TextEditingController();
  final TextEditingController initiatingPartyAMobileCountryCodeController = TextEditingController();
  final TextEditingController initiatingPartyAWhatsappController = TextEditingController();
  final TextEditingController initiatingPartyAWhatsappCountryCodeController = TextEditingController();
  final TextEditingController initiatingPartyAEmailController = TextEditingController();
  final TextEditingController initiatingPartyAAlternateEmailController = TextEditingController();
  final TextEditingController streetAddressInitiatingPartyAController = TextEditingController();
  final TextEditingController appartmentUnitSuiteNumberInitiatingPartyAController = TextEditingController();
  final TextEditingController postalCodeInitiatingPartyAController = TextEditingController();

  String? selectedInitiatingPartyATitle;

  // Date Selection Methods
  Future<void> selectDate(BuildContext context, {bool isClosingDate = false}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      if (isClosingDate) {
        closingDateController.text = "${picked.day}/${picked.month}/${picked.year}";
      } else {
        dateOfReferralController.text = "${picked.day}/${picked.month}/${picked.year}";
      }
      notifyListeners();
    }
  }

  // File Management
  void selectFiles() {
    // Implement file selection logic
    // This would typically use file_picker package
    notifyListeners();
  }

  void removeFile(int index) {
    if (index >= 0 && index < selectedFiles.length) {
      selectedFiles.removeAt(index);
      notifyListeners();
    }
  }

  // Form Submission
  Future<void> submitForm() async {
    setBusy(true);
    try {
      // Implement form submission logic
      await Future.delayed(Duration(seconds: 2)); // Simulate API call

      // Validate all parties data
      for (String partyId in initiatingParties) {
        final partyData = getInitiatingPartyData(partyId);
        // Validate party data here
      }

      for (String partyId in respondingParties) {
        final partyData = getRespondingPartyData(partyId);
        // Validate party data here
      }

      // Submit to API
      print("Form submitted successfully!");

    } catch (e) {
      // Handle error
      print("Error submitting form: $e");
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    // Dispose basic controllers
    courtCaseNumberController.dispose();
    odrIdController.dispose();
    titleController.dispose();
    dateOfReferralController.dispose();
    closingDateController.dispose();
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();

    // Dispose legacy controllers
    initiatingPartyAFirstNameController.dispose();
    initiatingPartyAMiddleNameController.dispose();
    initiatingPartyALastNameController.dispose();
    nationalityPartyAController.dispose();
    initiatingPartyAPassportController.dispose();
    initiatingPartyAPhoneController.dispose();
    initiatingPartyACountryCodeController.dispose();
    initiatingPartyAMobileController.dispose();
    initiatingPartyAMobileCountryCodeController.dispose();
    initiatingPartyAWhatsappController.dispose();
    initiatingPartyAWhatsappCountryCodeController.dispose();
    initiatingPartyAEmailController.dispose();
    initiatingPartyAAlternateEmailController.dispose();
    streetAddressInitiatingPartyAController.dispose();
    appartmentUnitSuiteNumberInitiatingPartyAController.dispose();
    postalCodeInitiatingPartyAController.dispose();

    // Dispose dynamic party controllers
    for (var partyData in initiatingPartiesData.values) {
      _disposePartyControllers(partyData);
    }

    for (var partyData in respondingPartiesData.values) {
      _disposePartyControllers(partyData);
    }

    for (var legalCouncilData in initiatingPartyLegalCouncils.values) {
      _disposeLegalCouncilControllers(legalCouncilData);
    }

    for (var legalCouncilData in respondingPartyLegalCouncils.values) {
      _disposeLegalCouncilControllers(legalCouncilData);
    }

    super.dispose();
  }

  void _disposePartyControllers(Map<String, dynamic> partyData) {
    partyData['firstNameController']?.dispose();
    partyData['middleNameController']?.dispose();
    partyData['lastNameController']?.dispose();
    partyData['nationalityController']?.dispose();
    partyData['passportController']?.dispose();
    partyData['phoneController']?.dispose();
    partyData['phoneCountryCodeController']?.dispose();
    partyData['mobileController']?.dispose();
    partyData['mobileCountryCodeController']?.dispose();
    partyData['whatsappController']?.dispose();
    partyData['whatsappCountryCodeController']?.dispose();
    partyData['emailController']?.dispose();
    partyData['alternateEmailController']?.dispose();

    // Dispose address controllers
    _disposeAddressControllers(partyData['currentAddress']);
    _disposeAddressControllers(partyData['permanentAddress']);
  }

  void _disposeLegalCouncilControllers(Map<String, dynamic> legalCouncilData) {
    legalCouncilData['firstNameController']?.dispose();
    legalCouncilData['middleNameController']?.dispose();
    legalCouncilData['lastNameController']?.dispose();
    legalCouncilData['emailController']?.dispose();
    legalCouncilData['phoneController']?.dispose();
    legalCouncilData['phoneCountryCodeController']?.dispose();

    // Dispose address controllers
    _disposeAddressControllers(legalCouncilData['currentAddress']);
    _disposeAddressControllers(legalCouncilData['permanentAddress']);
  }

  void _disposeAddressControllers(Map<String, dynamic>? addressData) {
    if (addressData != null) {
      addressData['streetAddressController']?.dispose();
      addressData['appartmentController']?.dispose();
      addressData['postalCodeController']?.dispose();
    }
  }
}