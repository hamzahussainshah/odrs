import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'select_account_type_viewmodel.dart';

class SelectAccountTypeView extends StackedView<SelectAccountTypeViewModel> {
  const SelectAccountTypeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SelectAccountTypeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SelectAccountTypeView")),
      ),
    );
  }

  @override
  SelectAccountTypeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SelectAccountTypeViewModel();
}
