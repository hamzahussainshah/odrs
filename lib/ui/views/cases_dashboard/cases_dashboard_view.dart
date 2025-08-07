import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'cases_dashboard_viewmodel.dart';

class CasesDashboardView extends StackedView<CasesDashboardViewModel> {
  const CasesDashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      CasesDashboardViewModel viewModel,
      Widget? child,
      ) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              20.verticalSpace,
              // Title Section
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).colorScheme.surfaceContainerHighest,
              //     borderRadius: BorderRadius.circular(12.r),
              //     border: Border.all(
              //       color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              //     ),
              //   ),
              //   child: Text(
              //     'Cases Dashboard',
              //     style: Theme.of(context).textTheme.displaySmall?.copyWith(
              //       color: Theme.of(context).colorScheme.onSurface,
              //       fontWeight: FontWeight.w600,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // 20.verticalSpace,
              // Data Table Container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                    ),
                    boxShadow: isDarkMode
                        ? null
                        : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerTheme: DividerThemeData(
                            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                            thickness: 1,
                          ),
                        ),
                        child: DataTable(
                          headingRowColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary,
                          ),
                          headingRowHeight: 56.h,
                          dataRowMinHeight: 48.h,
                          dataRowMaxHeight: 56.h,
                          headingTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                          dataTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          dataRowColor: WidgetStateProperty.resolveWith((states) {
                            if (states.contains(WidgetState.selected)) {
                              return Theme.of(context).colorScheme.primary.withOpacity(0.1);
                            }
                            if (states.contains(WidgetState.hovered)) {
                              return Theme.of(context).colorScheme.surfaceContainerHighest;
                            }
                            return Theme.of(context).colorScheme.surface;
                          }),
                          border: TableBorder.all(
                            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                            width: 1,
                          ),
                          columns: [
                            _buildDataColumn(context, 'ODR ID'),
                            _buildDataColumn(context, 'Court Case'),
                            _buildDataColumn(context, 'Case Title'),
                            _buildDataColumn(context, 'Nature of Dispute'),
                            _buildDataColumn(context, 'Initiating Party'),
                            _buildDataColumn(context, 'Responding Party'),
                            _buildDataColumn(context, 'Next Action'),
                            _buildDataColumn(context, 'Referral Date'),
                            _buildDataColumn(context, 'Closing Date'),
                            _buildDataColumn(context, 'Referred By'),
                            _buildDataColumn(context, 'Mediator'),
                            _buildDataColumn(context, 'Status'),
                          ],
                          rows: viewModel.caseDetails.asMap().entries.map((entry) {
                            final index = entry.key;
                            final caseDetail = entry.value;
                            final isEvenRow = index % 2 == 0;

                            return DataRow(
                              color: WidgetStateProperty.resolveWith((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return Theme.of(context).colorScheme.primary.withOpacity(0.1);
                                }
                                if (states.contains(WidgetState.hovered)) {
                                  return Theme.of(context).colorScheme.surfaceContainerHighest;
                                }
                                return isEvenRow
                                    ? Theme.of(context).colorScheme.surface
                                    : Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3);
                              }),
                              cells: [
                                _buildDataCell(context, caseDetail.odrId),
                                _buildDataCell(context, caseDetail.courtCase),
                                _buildDataCell(context, caseDetail.caseTitle),
                                _buildDataCell(context, caseDetail.natureOfDispute),
                                _buildDataCell(context, caseDetail.initiatingParty),
                                _buildDataCell(context, caseDetail.respondingParty),
                                _buildDataCell(context, caseDetail.nextAction),
                                _buildDataCell(context, caseDetail.referralDate),
                                _buildDataCell(context, caseDetail.closingDate),
                                _buildDataCell(context, caseDetail.referredBy),
                                _buildDataCell(context, caseDetail.mediator),
                                _buildStatusCell(context, caseDetail.status),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn(BuildContext context, String label) {
    return DataColumn(
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  DataCell _buildDataCell(BuildContext context, String value) {
    return DataCell(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  DataCell _buildStatusCell(BuildContext context, String status) {
    Color statusColor;
    Color statusBgColor;

    // Define colors based on status
    switch (status.toLowerCase()) {
      case 'active':
      case 'ongoing':
        statusColor = Colors.green;
        statusBgColor = Colors.green.withOpacity(0.1);
        break;
      case 'completed':
      case 'closed':
        statusColor = Colors.blue;
        statusBgColor = Colors.blue.withOpacity(0.1);
        break;
      case 'pending':
        statusColor = Colors.orange;
        statusBgColor = Colors.orange.withOpacity(0.1);
        break;
      case 'cancelled':
      case 'terminated':
        statusColor = Colors.red;
        statusBgColor = Colors.red.withOpacity(0.1);
        break;
      default:
        statusColor = Theme.of(context).colorScheme.onSurface;
        statusBgColor = Theme.of(context).colorScheme.surfaceContainerHighest;
    }

    return DataCell(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: statusBgColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: statusColor.withOpacity(0.3)),
          ),
          child: Text(
            status,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  CasesDashboardViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      CasesDashboardViewModel();
}