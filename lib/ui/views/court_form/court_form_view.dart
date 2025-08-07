import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odrs/ui/widgets/text_field.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/phone_field.dart';
import 'court_form_viewmodel.dart';
import '../../widgets/custom_dropdown.dart'; // Import your custom dropdown

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

              // Court Information Section
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
                        title: "Create Initiating Parties",
                        color: Theme.of(context).colorScheme.primary),
                    Container(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        children: [
                          CustomDropdown(
                            labelText: "Initiating Party Type",
                            value: viewModel.selectedInitiatingPartyType,
                            items: viewModel.initiatingPartyType,
                            onChanged: (value) => viewModel
                                .setSelectedInitiatingPartyType(value!),
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
              buildInitiatingPartyA(
                context,
                viewModel,
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
      {required BuildContext context, required String title, Color? color}) {
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
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
        textAlign: TextAlign.center,
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

  Widget buildInitiatingPartyA(
      BuildContext context, CourtFormViewModel viewModel) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
              title: "Initiating Party A",
              color: Theme.of(context).colorScheme.primary),
          Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                CustomDropdown(
                  labelText: "Title",
                  value: viewModel.selectedInitiatingPartyATitle,
                  items: viewModel.initiatingPartyATitleOptions,
                  onChanged: (value) =>
                      viewModel.setSelectedInitiatingPartyATitle(value!),
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "First Name",
                  controller: viewModel.initiatingPartyAFirstNameController,
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Middle Name",
                  controller: viewModel.initiatingPartyAMiddleNameController,
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Last Name",
                  controller: viewModel.initiatingPartyALastNameController,
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Nationality",
                  controller: viewModel.nationalityPartyAController,
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
                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                        bottomSheetHeight:
                            500, // Optional. Country list modal height
                        //Optional. Sets the border radius for the bottomsheet.
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        //Optional. Styles the search field.
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
                        viewModel.nationalityPartyAController.text =
                            country.flagEmoji + ' ' + country.name;
                      },
                    );
                  },
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Passport No",
                  controller: viewModel.initiatingPartyAPassportController,
                ),
                15.verticalSpace,
                PhoneField(
                  controller: viewModel.initiatingPartyAPhoneController,
                  countryCodeController:
                      viewModel.initiatingPartyACountryCodeController,
                  hintText: "Phone No",
                  labelText: "Phone No",
                ),
                15.verticalSpace,
                PhoneField(
                  hintText: "Mobile No",
                  labelText: "Mobile No",
                  controller: viewModel.initiatingPartyAMobileController,
                  countryCodeController:
                      viewModel.initiatingPartyAMobileCountryCodeController,
                ),
                15.verticalSpace,
                PhoneField(
                  hintText: "Whatsapp No",
                  labelText: "Whatsapp No",
                  controller: viewModel.initiatingPartyAWhatsappController,
                  countryCodeController:
                      viewModel.initiatingPartyAWhatsappCountryCodeController,
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Email",
                  controller: viewModel.initiatingPartyAEmailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                15.verticalSpace,
                CustomTextField(
                  hintText: "Alternate Email",
                  controller:
                      viewModel.initiatingPartyAAlternateEmailController,
                ),
                15.verticalSpace,
                //    // In buildInitiatingPartyA (replace the comment with this code)
                CheckboxListTile(
                  title: Text("Current Address"),
                  value: viewModel.isCurrentAddressChecked,
                  onChanged: (value) =>
                      viewModel.setCurrentAddressChecked(value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                15.verticalSpace,
                CheckboxListTile(
                  title: Text("Permanent Address"),
                  value: viewModel.isPermanentAddressChecked,
                  onChanged: (value) =>
                      viewModel.setPermanentAddressChecked(value ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                15.verticalSpace,
                _buildFileUploadSection(context, viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  CourtFormViewModel viewModelBuilder(BuildContext context) =>
      CourtFormViewModel();
}
