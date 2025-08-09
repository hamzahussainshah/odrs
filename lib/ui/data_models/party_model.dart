import 'package:flutter/material.dart';

// Data Models for managing party information
class PartyModel {
  String? selectedTitle;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phoneCountryCodeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController mobileCountryCodeController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController whatsappCountryCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alternateEmailController = TextEditingController();

  bool showCurrentAddress = false;
  bool showPermanentAddress = false;
  AddressModel? currentAddress;
  AddressModel? permanentAddress;

  LegalCouncilModel? legalCouncil;

  PartyModel() {
    // Initialize address models when checkboxes are checked
  }

  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    nationalityController.dispose();
    passportController.dispose();
    phoneController.dispose();
    phoneCountryCodeController.dispose();
    mobileController.dispose();
    mobileCountryCodeController.dispose();
    whatsappController.dispose();
    whatsappCountryCodeController.dispose();
    emailController.dispose();
    alternateEmailController.dispose();
    currentAddress?.dispose();
    permanentAddress?.dispose();
    legalCouncil?.dispose();
  }
}

class LegalCouncilModel {
  String? selectedTitle;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phoneCountryCodeController = TextEditingController();

  bool showCurrentAddress = false;
  bool showPermanentAddress = false;
  AddressModel? currentAddress;
  AddressModel? permanentAddress;

  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    phoneCountryCodeController.dispose();
    currentAddress?.dispose();
    permanentAddress?.dispose();
  }
}

class AddressModel {
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  void dispose() {
    streetAddressController.dispose();
    apartmentController.dispose();
    postalCodeController.dispose();
  }
}