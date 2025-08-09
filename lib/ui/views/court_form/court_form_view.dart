import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odrs/ui/widgets/button.dart';
import 'package:odrs/ui/widgets/text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:csc_picker_plus/csc_picker_plus.dart';
import '../../widgets/phone_field.dart';
import 'court_form_viewmodel.dart';
import '../../widgets/custom_dropdown.dart';

class CourtFormView extends StackedView<CourtFormViewModel> {
  const CourtFormView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      CourtFormViewModel viewModel,
      Widget? child,
      ) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Column(
            children: [
              // Main Form Container
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: isDarkMode
                      ? null
                      : [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withValues(alpha: 0.1),
                      blurRadius: 10.r,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  children: [
                    // Main Header
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r)),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text(
                        "Court Mediation Case Form",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // Case Details Section
                    Container(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        children: [
                          _buildSectionHeader(
                              context: context, title: "Case Details"),
                          20.verticalSpace,

                          CustomTextField(
                            hintText: "Court Case Number",
                            controller: viewModel.courtCaseNumberController,
                          ),
                          15.verticalSpace,

                          CustomTextField(
                            hintText: "ODR ID",
                            controller: viewModel.odrIdController,
                          ),
                          15.verticalSpace,

                          CustomTextField(
                            hintText: "Title",
                            controller: viewModel.titleController,
                          ),
                          15.verticalSpace,

                          CustomTextField(
                            hintText: "Date of Referral",
                            controller: viewModel.dateOfReferralController,
                            readOnly: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () => viewModel.selectDate(context),
                            ),
                          ),
                          15.verticalSpace,

                          CustomTextField(
                            hintText: "Closing Date",
                            controller: viewModel.closingDateController,
                            readOnly: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () => viewModel.selectDate(context,
                                  isClosingDate: true),
                            ),
                          ),
                          15.verticalSpace,

                          CustomDropdown(
                            labelText: "Nature of Dispute",
                            value: viewModel.selectedNatureOfDispute,
                            items: viewModel.natureOfDisputeOptions,
                            onChanged: (value) =>
                                viewModel.setSelectedNatureOfDispute(value!),
                          ),
                          15.verticalSpace,

                          CustomDropdown(
                            labelText: "Preferred/Assigned Mediator",
                            value: viewModel.selectedMediator,
                            items: viewModel.mediatorOptions,
                            onChanged: (value) =>
                                viewModel.setSelectedMediator(value!),
                          ),
                          15.verticalSpace,

                          // File Upload Section
                          _buildFileUploadSection(context, viewModel),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              20.verticalSpace,

              // Referred By Section
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: isDarkMode
                      ? null
                      : [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withOpacity(0.1),
                      blurRadius: 10.r,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color:
                    Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  children: [
                    _buildSectionHeader(context: context, title: "Referred By"),
                    Container(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        children: [
                          CustomDropdown(
                            labelText: "Title",
                            value: viewModel.selectedTitle,
                            items: viewModel.titleOptions,
                            onChanged: (value) =>
                                viewModel.setSelectedTitle(value!),
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            hintText: "First Name",
                            controller: viewModel.firstNameController,
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            hintText: "Middle Name",
                            controller: viewModel.middleNameController,
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            hintText: "Last Name",
                            controller: viewModel.lastNameController,
                          ),
                          15.verticalSpace,
                          CustomDropdown(
                            labelText: "Court Name",
                            value: viewModel.selectedCourtName,
                            items: viewModel.courtNameOptions,
                            onChanged: (value) =>
                                viewModel.setSelectedCourtName(value!),
                          ),
                          15.verticalSpace,
                          CustomDropdown(
                            labelText: "Jurisdiction",
                            value: viewModel.selectedJurisdiction,
                            items: viewModel.jurisdictionOptions,
                            onChanged: (value) =>
                                viewModel.setSelectedJurisdiction(value!),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              20.verticalSpace,




              // Dynamic Parties Section
              ...viewModel.initiatingParties.asMap().entries.map((entry) {
                final index = entry.key;
                final partyId = entry.value;
                final partyLetter = String.fromCharCode(65 + index); // A, B, C, etc.

                return Column(
                  children: [
                    buildInitiatingParty(context, viewModel, partyId, partyLetter, index),
                    15.verticalSpace,
                    // Legal Council for this party if it exists
                    if (viewModel.initiatingPartyLegalCouncils.containsKey(partyId))
                      Column(
                        children: [
                          buildLegalCouncilForInitiatingParty(context, viewModel, partyId, partyLetter),
                          15.verticalSpace,
                        ],
                      ),
                  ],
                );
              }).toList(),

              // Dynamic Responding Parties Section
              ...viewModel.respondingParties.asMap().entries.map((entry) {
                final index = entry.key;
                final partyId = entry.value;
                final partyLetter = String.fromCharCode(65 + index); // A, B, C, etc.

                return Column(
                  children: [
                    buildRespondingParty(context, viewModel, partyId, partyLetter, index),
                    15.verticalSpace,
                    // Legal Council for this party if it exists
                    if (viewModel.respondingPartyLegalCouncils.containsKey(partyId))
                      Column(
                        children: [
                          buildLegalCouncilForRespondingParty(context, viewModel, partyId, partyLetter),
                          15.verticalSpace,
                        ],
                      ),
                  ],
                );
              }).toList(),
              15.verticalSpace,
              // Party Type Selection Section
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: isDarkMode
                      ? null
                      : [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withValues(alpha: 0.1),
                      blurRadius: 10.r,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  children: [
                    _buildSectionHeader(
                        context: context,
                        title: "Create Parties",
                        color: Theme.of(context).colorScheme.primary),
                    Container(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        children: [
                          CustomDropdown(
                            labelText: "Party Type to Add",
                            value: viewModel.selectedPartyTypeToAdd,
                            items: const <String>["Initiating Party", "Responding Party"],
                            onChanged: (value) => viewModel.setSelectedPartyTypeToAdd(value!),
                          ),
                          15.verticalSpace,
                          CustomButton(
                              text: "Add Party",
                              onPressed: () => viewModel.addNewParty()
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              30.verticalSpace,


              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                  viewModel.isBusy ? null : () => viewModel.submitForm(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    elevation: 2,
                  ),
                  child: viewModel.isBusy
                      ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary,
                      strokeWidth: 2,
                    ),
                  )
                      : Text(
                    'Submit Form',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      {required BuildContext context,
        required String title,
        Color? color,
        bool isButton = false,
        VoidCallback? onPressedButton,
        String? buttonText}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        color: color ??
            Theme.of(context)
                .colorScheme
                .onSurfaceVariant
                .withValues(alpha: 0.8),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          if (isButton)
            Column(
              children: [
                8.verticalSpace,
                CustomButton(
                  text: buttonText ?? "Action",
                  onPressed: onPressedButton,
                  isBgColor: false,
                  borderColor: Theme.of(context).colorScheme.surface,
                  textColor: Theme.of(context).colorScheme.surface,
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildFileUploadSection(
      BuildContext context, CourtFormViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => viewModel.selectFiles(),
          borderRadius: BorderRadius.circular(15.r),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  size: 32.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                8.verticalSpace,
                Text(
                  "Upload Documents",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                Text(
                  "Tap to select files",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Display selected files
        if (viewModel.selectedFiles.isNotEmpty) ...[
          12.verticalSpace,
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selected Files:",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                8.verticalSpace,
                ...viewModel.selectedFiles.asMap().entries.map(
                      (entry) {
                    final index = entry.key;
                    final file = entry.value;
                    return Container(
                      margin: EdgeInsets.only(bottom: 4.h),
                      padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.insert_drive_file,
                            size: 16.sp,
                            color:
                            Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              file.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                color:
                                Theme.of(context).colorScheme.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () => viewModel.removeFile(index),
                            icon: Icon(
                              Icons.close,
                              size: 16.sp,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 24.w,
                              minHeight: 24.h,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget buildInitiatingParty(
      BuildContext context, CourtFormViewModel viewModel, String partyId, String partyLetter, int index) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final partyData = viewModel.getInitiatingPartyData(partyId);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: isDarkMode
            ? null
            : [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .shadow
                .withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          _buildSectionHeader(
              context: context,
              title: "Initiating Party $partyLetter",
              color: Theme.of(context).colorScheme.primary,
              isButton: true,
              buttonText: "Remove Party",
              onPressedButton: () => viewModel.removeInitiatingParty(partyId, index)),
          Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                CustomDropdown(
                  labelText: "Title",
                  value: partyData['selectedTitle'],
                  items: viewModel.initiatingPartyATitleOptions,
                  onChanged: (value) =>
                      viewModel.setInitiatingPartyData(partyId, 'selectedTitle', value!),
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "First Name",
                  controller: partyData['firstNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Middle Name",
                  controller: partyData['middleNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Last Name",
                  controller: partyData['lastNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Nationality",
                  controller: partyData['nationalityController'],
                  readOnly: true,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      exclude: <String>['IL', 'IN'],
                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 16, color: Colors.blueGrey),
                        bottomSheetHeight: 500,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8)
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                      ),
                      onSelect: (Country country) {
                        partyData['nationalityController'].text =
                            country.flagEmoji + ' ' + country.name;
                      },
                    );
                  },
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Passport No",
                  controller: partyData['passportController'],
                ),
                15.verticalSpace,
                PhoneField(
                  controller: partyData['phoneController'],
                  countryCodeController: partyData['phoneCountryCodeController'],
                  hintText: "Phone No",
                  labelText: "Phone No",
                ),
                15.verticalSpace,
                PhoneField(
                  hintText: "Mobile No",
                  labelText: "Mobile No",
                  controller: partyData['mobileController'],
                  countryCodeController: partyData['mobileCountryCodeController'],
                ),
                15.verticalSpace,
                PhoneField(
                  hintText: "Whatsapp No",
                  labelText: "Whatsapp No",
                  controller: partyData['whatsappController'],
                  countryCodeController: partyData['whatsappCountryCodeController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Email",
                  controller: partyData['emailController'],
                  keyboardType: TextInputType.emailAddress,
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Alternate Email",
                  controller: partyData['alternateEmailController'],
                ),
                15.verticalSpace,

                // Address checkboxes
                CheckboxListTile(
                  title: const Text("Current Address"),
                  value: partyData['isCurrentAddressChecked'] ?? false,
                  onChanged: (value) => viewModel.setInitiatingPartyData(
                      partyId, 'isCurrentAddressChecked', value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text("Permanent Address"),
                  value: partyData['isPermanentAddressChecked'] ?? false,
                  onChanged: (value) => viewModel.setInitiatingPartyData(
                      partyId, 'isPermanentAddressChecked', value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),

          // Conditional Address Sections
          if (partyData['isCurrentAddressChecked'] == true)
            buildAddressSection(
              context,
              viewModel,
              "Current Address for Initiating Party $partyLetter",
              partyId,
              false,
              false
            ),
          if (partyData['isPermanentAddressChecked'] == true)
            Column(
              children: [
                15.verticalSpace,
                buildAddressSection(
                  context,
                  viewModel,
                  "Permanent Address for Initiating Party $partyLetter",
                  partyId,
                  true,
                  false,
                ),
              ],
            ),

          15.verticalSpace,
          _buildFileUploadSection(context, viewModel),
          15.verticalSpace,

          // Legal Council Button - Only show if no legal council exists
          if (!viewModel.initiatingPartyLegalCouncils.containsKey(partyId))
            CustomButton(
              text: "Add Legal Council",
              onPressed: () => viewModel.addLegalCouncilForInitiatingParty(partyId),
              isBgColor: false,
            ),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget buildLegalCouncilForInitiatingParty(
      BuildContext context, CourtFormViewModel viewModel, String partyId, String partyLetter) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final legalCouncilData = viewModel.getInitiatingPartyLegalCouncilData(partyId);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: isDarkMode
            ? null
            : [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .shadow
                .withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          _buildSectionHeader(
              context: context,
              title: "Legal Council for Initiating Party $partyLetter",
              color: Theme.of(context).colorScheme.secondary,
              isButton: true,
              buttonText: "Remove Legal Council",
              onPressedButton: () => viewModel.removeLegalCouncilForInitiatingParty(partyId)),
          Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                CustomDropdown(
                  labelText: "Title",
                  value: legalCouncilData['selectedTitle'],
                  items: viewModel.initiatingPartyATitleOptions,
                  onChanged: (value) =>
                      viewModel.setInitiatingPartyLegalCouncilData(partyId, 'selectedTitle', value!),
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "First Name",
                  controller: legalCouncilData['firstNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Middle Name",
                  controller: legalCouncilData['middleNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Last Name",
                  controller: legalCouncilData['lastNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Email",
                  controller: legalCouncilData['emailController'],
                  keyboardType: TextInputType.emailAddress,
                ),
                15.verticalSpace,
                PhoneField(
                  controller: legalCouncilData['phoneController'],
                  countryCodeController: legalCouncilData['phoneCountryCodeController'],
                  hintText: "Phone No",
                  labelText: "Phone No",
                ),
                15.verticalSpace,

                // Legal Council Address checkboxes
                CheckboxListTile(
                  title: const Text("Legal Council Current Address"),
                  value: legalCouncilData['isCurrentAddressChecked'] ?? false,
                  onChanged: (value) => viewModel.setInitiatingPartyLegalCouncilData(
                      partyId, 'isCurrentAddressChecked', value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text("Legal Council Permanent Address"),
                  value: legalCouncilData['isPermanentAddressChecked'] ?? false,
                  onChanged: (value) => viewModel.setInitiatingPartyLegalCouncilData(
                      partyId, 'isPermanentAddressChecked', value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),

          // Conditional Address Sections for Legal Council
          if (legalCouncilData['isCurrentAddressChecked'] == true)
            buildLegalCouncilAddressSection(
              context,
              viewModel,
              "Legal Counsel Current Address for Initiating Party $partyLetter",
              partyId,
              false,
              true, // isInitiatingParty
            ),
          if (legalCouncilData['isPermanentAddressChecked'] == true)
            Column(
              children: [
                15.verticalSpace,
                buildLegalCouncilAddressSection(
                  context,
                  viewModel,
                  "Legal Counsel Permanent Address for Initiating Party $partyLetter",
                  partyId,
                  true,
                  true, // isInitiatingParty
                ),
              ],
            ),

          15.verticalSpace,
          _buildFileUploadSection(context, viewModel),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget buildRespondingParty(
      BuildContext context, CourtFormViewModel viewModel, String partyId, String partyLetter, int index) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final partyData = viewModel.getRespondingPartyData(partyId);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: isDarkMode
            ? null
            : [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .shadow
                .withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          _buildSectionHeader(
              context: context,
              title: "Responding Party $partyLetter",
              color: Theme.of(context).colorScheme.tertiary,
              isButton: true,
              buttonText: "Remove Party",
              onPressedButton: () => viewModel.removeRespondingParty(partyId, index)),
          Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                CustomDropdown(
                  labelText: "Title",
                  value: partyData['selectedTitle'],
                  items: viewModel.initiatingPartyATitleOptions,
                  onChanged: (value) =>
                      viewModel.setRespondingPartyData(partyId, 'selectedTitle', value!),
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "First Name",
                  controller: partyData['firstNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Middle Name",
                  controller: partyData['middleNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Last Name",
                  controller: partyData['lastNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Nationality",
                  controller: partyData['nationalityController'],
                  readOnly: true,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      exclude: <String>['IL', 'IN'],
                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 16, color: Colors.blueGrey),
                        bottomSheetHeight: 500,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8)
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                      ),
                      onSelect: (Country country) {
                        partyData['nationalityController'].text =
                            country.flagEmoji + ' ' + country.name;
                      },
                    );
                  },
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Passport No",
                  controller: partyData['passportController'],
                ),
                15.verticalSpace,
                PhoneField(
                  controller: partyData['phoneController'],
                  countryCodeController: partyData['phoneCountryCodeController'],
                  hintText: "Phone No",
                  labelText: "Phone No",
                ),
                15.verticalSpace,
                PhoneField(
                  hintText: "Mobile No",
                  labelText: "Mobile No",
                  controller: partyData['mobileController'],
                  countryCodeController: partyData['mobileCountryCodeController'],
                ),
                15.verticalSpace,
                PhoneField(
                  hintText: "Whatsapp No",
                  labelText: "Whatsapp No",
                  controller: partyData['whatsappController'],
                  countryCodeController: partyData['whatsappCountryCodeController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Email",
                  controller: partyData['emailController'],
                  keyboardType: TextInputType.emailAddress,
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Alternate Email",
                  controller: partyData['alternateEmailController'],
                ),
                15.verticalSpace,

                // Address checkboxes
                CheckboxListTile(
                  title: const Text("Current Address"),
                  value: partyData['isCurrentAddressChecked'] ?? false,
                  onChanged: (value) => viewModel.setRespondingPartyData(
                      partyId, 'isCurrentAddressChecked', value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text("Permanent Address"),
                  value: partyData['isPermanentAddressChecked'] ?? false,
                  onChanged: (value) => viewModel.setRespondingPartyData(
                      partyId, 'isPermanentAddressChecked', value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),

          // Conditional Address Sections
          if (partyData['isCurrentAddressChecked'] == true)
            buildAddressSection(
              context,
              viewModel,
              "Current Address for Responding Party $partyLetter",
              partyId,
              false,
              false, // isInitiatingParty = false
            ),
          if (partyData['isPermanentAddressChecked'] == true)
            Column(
              children: [
                15.verticalSpace,
                buildAddressSection(
                  context,
                  viewModel,
                  "Permanent Address for Responding Party $partyLetter",
                  partyId,
                  true,
                  false, // isInitiatingParty = false
                ),
              ],
            ),

          15.verticalSpace,
          _buildFileUploadSection(context, viewModel),
          15.verticalSpace,

          // Legal Council Button - Only show if no legal council exists
          if (!viewModel.respondingPartyLegalCouncils.containsKey(partyId))
            CustomButton(
              text: "Add Legal Council",
              onPressed: () => viewModel.addLegalCouncilForRespondingParty(partyId),
              isBgColor: false,
            ),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget buildLegalCouncilForRespondingParty(
      BuildContext context, CourtFormViewModel viewModel, String partyId, String partyLetter) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final legalCouncilData = viewModel.getRespondingPartyLegalCouncilData(partyId);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: isDarkMode
            ? null
            : [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .shadow
                .withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          _buildSectionHeader(
              context: context,
              title: "Legal Council for Responding Party $partyLetter",
              color: Theme.of(context).colorScheme.secondary,
              isButton: true,
              buttonText: "Remove Legal Council",
              onPressedButton: () => viewModel.removeLegalCouncilForRespondingParty(partyId)),
          Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                CustomDropdown(
                  labelText: "Title",
                  value: legalCouncilData['selectedTitle'],
                  items: viewModel.initiatingPartyATitleOptions,
                  onChanged: (value) =>
                      viewModel.setRespondingPartyLegalCouncilData(partyId, 'selectedTitle', value!),
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "First Name",
                  controller: legalCouncilData['firstNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Middle Name",
                  controller: legalCouncilData['middleNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Last Name",
                  controller: legalCouncilData['lastNameController'],
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Email",
                  controller: legalCouncilData['emailController'],
                  keyboardType: TextInputType.emailAddress,
                ),
                15.verticalSpace,
                PhoneField(
                  controller: legalCouncilData['phoneController'],
                  countryCodeController: legalCouncilData['phoneCountryCodeController'],
                  hintText: "Phone No",
                  labelText: "Phone No",
                ),
                15.verticalSpace,

                // Legal Council Address checkboxes
                CheckboxListTile(
                  title: const Text("Legal Council Current Address"),
                  value: legalCouncilData['isCurrentAddressChecked'] ?? false,
                  onChanged: (value) => viewModel.setRespondingPartyLegalCouncilData(
                      partyId, 'isCurrentAddressChecked', value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text("Legal Council Permanent Address"),
                  value: legalCouncilData['isPermanentAddressChecked'] ?? false,
                  onChanged: (value) => viewModel.setRespondingPartyLegalCouncilData(
                      partyId, 'isPermanentAddressChecked', value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),

          // Conditional Address Sections for Legal Council
          if (legalCouncilData['isCurrentAddressChecked'] == true)
            buildLegalCouncilAddressSection(
              context,
              viewModel,
              "Legal Counsel Current Address for Responding Party $partyLetter",
              partyId,
              false,
              false, // isInitiatingParty = false
            ),
          if (legalCouncilData['isPermanentAddressChecked'] == true)
            Column(
              children: [
                15.verticalSpace,
                buildLegalCouncilAddressSection(
                  context,
                  viewModel,
                  "Legal Counsel Permanent Address for Responding Party $partyLetter",
                  partyId,
                  true,
                  false, // isInitiatingParty = false
                ),
              ],
            ),

          15.verticalSpace,
          _buildFileUploadSection(context, viewModel),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget buildAddressSection(
      BuildContext context,
      CourtFormViewModel viewModel,
      String title,
      String partyId,
      bool isPermanentAddress,
      bool isInitiatingParty) {

    final addressData = isInitiatingParty
        ? viewModel.getInitiatingPartyAddressData(partyId, isPermanentAddress)
        : viewModel.getRespondingPartyAddressData(partyId, isPermanentAddress);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          context: context,
          title: title,
        ),
        10.verticalSpace,
        CustomTextField(
          hintText: "Street Address",
          controller: addressData['streetAddressController'] as TextEditingController? ?? TextEditingController(),
        ),
        10.verticalSpace,
        CustomTextField(
          hintText: "Appartment/Unit/Suite Number",
          controller: addressData['appartmentController'] as TextEditingController? ?? TextEditingController(),
        ),
        10.verticalSpace,
        CSCPickerPlus(
          showStates: true,
          showCities: true,
          flagState: CountryFlag.ENABLE,
          countryStateLanguage: CountryStateLanguage.englishOrNative,
          cityLanguage: CityLanguage.native,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          disabledDropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
            border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                width: 1),
          ),
          countryDropdownLabel: "Select Country",
          stateDropdownLabel: "Select State/Province",
          cityDropdownLabel: "Select City",
          countrySearchPlaceholder: "Search Country",
          stateSearchPlaceholder: "Search State",
          citySearchPlaceholder: "Search City",
          defaultCountry: CscCountry.Pakistan,
          selectedItemStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          dropdownHeadingStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
          dropdownItemStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14.sp,
          ),
          dropdownDialogRadius: 12.0,
          searchBarRadius: 8.0,
          onCountryChanged: (value) {
            if (isInitiatingParty) {
              viewModel.setInitiatingPartyAddressData(partyId, isPermanentAddress, 'selectedCountry', value);
            } else {
              viewModel.setRespondingPartyAddressData(partyId, isPermanentAddress, 'selectedCountry', value);
            }
          },
          onStateChanged: (value) {
            if (value != null && value.isNotEmpty) {
              if (isInitiatingParty) {
                viewModel.setInitiatingPartyAddressData(partyId, isPermanentAddress, 'selectedState', value);
              } else {
                viewModel.setRespondingPartyAddressData(partyId, isPermanentAddress, 'selectedState', value);
              }
            }
          },
          onCityChanged: (value) {
            if (value != null && value.isNotEmpty) {
              if (isInitiatingParty) {
                viewModel.setInitiatingPartyAddressData(partyId, isPermanentAddress, 'selectedCity', value);
              } else {
                viewModel.setRespondingPartyAddressData(partyId, isPermanentAddress, 'selectedCity', value);
              }
            }
          },
        ),
        10.verticalSpace,
        CustomTextField(
          hintText: "Postal/Zip Code",
          controller: addressData['postalCodeController'] as TextEditingController? ?? TextEditingController(),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget buildLegalCouncilAddressSection(
      BuildContext context,
      CourtFormViewModel viewModel,
      String title,
      String partyId,
      bool isPermanentAddress,
      bool isInitiatingParty) {

    final addressData = isInitiatingParty
        ? viewModel.getInitiatingPartyLegalCouncilAddressData(partyId, isPermanentAddress)
        : viewModel.getRespondingPartyLegalCouncilAddressData(partyId, isPermanentAddress);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          context: context,
          title: title,
        ),
        10.verticalSpace,
        CustomTextField(
          hintText: "Street Address",
          controller: addressData['streetAddressController'],
        ),
        10.verticalSpace,
        CustomTextField(
          hintText: "Appartment/Unit/Suite Number",
          controller: addressData['appartmentController'],
        ),
        10.verticalSpace,
        CSCPickerPlus(
          showStates: true,
          showCities: true,
          flagState: CountryFlag.ENABLE,
          countryStateLanguage: CountryStateLanguage.englishOrNative,
          cityLanguage: CityLanguage.native,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          disabledDropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
            border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                width: 1),
          ),
          countryDropdownLabel: "Select Country",
          stateDropdownLabel: "Select State/Province",
          cityDropdownLabel: "Select City",
          countrySearchPlaceholder: "Search Country",
          stateSearchPlaceholder: "Search State",
          citySearchPlaceholder: "Search City",
          defaultCountry: CscCountry.Pakistan,
          selectedItemStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          dropdownHeadingStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
          dropdownItemStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14.sp,
          ),
          dropdownDialogRadius: 12.0,
          searchBarRadius: 8.0,
          onCountryChanged: (value) {
            if (isInitiatingParty) {
              viewModel.setInitiatingPartyLegalCouncilAddressData(partyId, isPermanentAddress, 'selectedCountry', value);
            } else {
              viewModel.setRespondingPartyLegalCouncilAddressData(partyId, isPermanentAddress, 'selectedCountry', value);
            }
          },
          onStateChanged: (value) {
            if (value != null && value.isNotEmpty) {
              if (isInitiatingParty) {
                viewModel.setInitiatingPartyLegalCouncilAddressData(partyId, isPermanentAddress, 'selectedState', value);
              } else {
                viewModel.setRespondingPartyLegalCouncilAddressData(partyId, isPermanentAddress, 'selectedState', value);
              }
            }
          },
          onCityChanged: (value) {
            if (value != null && value.isNotEmpty) {
              if (isInitiatingParty) {
                viewModel.setInitiatingPartyLegalCouncilAddressData(partyId, isPermanentAddress, 'selectedCity', value);
              } else {
                viewModel.setRespondingPartyLegalCouncilAddressData(partyId, isPermanentAddress, 'selectedCity', value);
              }
            }
          },
        ),
        10.verticalSpace,
        CustomTextField(
          hintText: "Postal/Zip Code",
          controller: addressData['postalCodeController'],
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  @override
  CourtFormViewModel viewModelBuilder(BuildContext context) =>
      CourtFormViewModel();
}