import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'case_details_viewmodel.dart';

class CaseDetailsView extends StackedView<CaseDetailsViewModel> {
  const CaseDetailsView({super.key});

  @override
  Widget builder(
      BuildContext context,
      CaseDetailsViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [

            ]
          ),
        ),
      ),
    );
  }

  @override
  CaseDetailsViewModel viewModelBuilder(BuildContext context) =>
      CaseDetailsViewModel();
}
