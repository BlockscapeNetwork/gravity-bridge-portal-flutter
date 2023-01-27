// /*
//     Gravity Bridge is a UI for interacting with the gravity chain.
//     Copyright (C) 2023  blockscape Finance AG, Switzerland
//
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
//
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.
// */

import 'package:flutter/material.dart';

class SortableDataTable<T> extends StatefulWidget {
  const SortableDataTable({
    Key? key,
    required this.columns,
    required this.rows,
    required this.modelToRow,
    this.onTap,
    this.onSortRow,
    this.cellBuilder,
    this.selectableBuilder,
    this.onSelectionChanged,
    this.initialSortIndex = 0,
    this.customColumnLabelWidgets = const {},
  }) : super(key: key);

  ///list of column labels used on the header
  final Set<String> columns;

  final Map<String, Widget?> customColumnLabelWidgets;

  ///list of rows in a given format. used to trigger on select and other functions
  final List<T> rows;

  /// function to convert row items into strings which are used for sorting, and used to render the cells (if no custom widgets were given into [cellBuilder])
  final List<String> Function(T) modelToRow;

  ///callback function called when a row was clicked
  final void Function(T)? onTap;

  ///function comparing elements. used to sort rows
  final int Function(T a, T b, int index)? onSortRow;

  ///optional function to custom render cells
  final Widget? Function(T item, String text, int index)? cellBuilder;

  //if null: rows not selectable
  final bool Function(T)? selectableBuilder;

  //callback function which returns a list of selected rows
  final void Function(Set<T>)? onSelectionChanged;

  final int initialSortIndex;

  @override
  _SortableDataTableState createState() => _SortableDataTableState<T>();
}

class _SortableDataTableState<T> extends State<SortableDataTable<T>> {
  late int _sortIndex = widget.initialSortIndex;
  bool _sortAsc = false;
  final Set<T> _selectedItems = {};
  bool _showCheckboxRow = false;

  @override
  void initState() {
    _sort(_sortIndex, _sortAsc);
    super.initState();
  }

  ///sorts rows. if widget.onSortRow is not provided, use a fallback sort mechanism
  List<T> _sort(int index, bool asc) {
    return widget.rows
      ..sort((a, b) => widget.onSortRow == null
          ? widget
              .modelToRow(asc ? a : b)[index]
              .compareTo(widget.modelToRow(asc ? b : a)[index])
          : widget.onSortRow!(asc ? a : b, asc ? b : a, index));
  }

  ///calls _sort and updates the ui
  void _updateAndSort(int index, bool asc) {
    setState(() {
      _sort(index, asc);
      _sortIndex = index;
      _sortAsc = asc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final equalRowWidth = (constraints.maxWidth - widget.columns.length) /
          widget.columns.length;

      return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: DataTable(
            sortAscending: _sortAsc,
            sortColumnIndex: _sortIndex,
            columnSpacing: 0,
            showCheckboxColumn: _showCheckboxRow,
            columns: widget.columns.map(
              (e) {
                final columnLabelWidget = widget.customColumnLabelWidgets[e] ??
                    Text(
                      e,
                      // style: const TextStyle(fontStyle: FontStyle.italic),
                    );
                return DataColumn(
                  label: columnLabelWidget,
                  onSort: _updateAndSort,
                );
              },
            ).toList(),
            rows: _sort(_sortIndex, _sortAsc).map((item) {
              final labels = widget.modelToRow(item);

              return DataRow(
                selected: _selectedItems.contains(item),
                onSelectChanged: widget.selectableBuilder != null
                    ? !widget.selectableBuilder!(item)
                        ? null
                        : (selected) {
                            setState(() {
                              if (selected == true) {
                                _selectedItems.add(item);
                                _showCheckboxRow = true;
                              } else {
                                _selectedItems.remove(item);
                              }
                            });

                            if (widget.onSelectionChanged != null) {
                              widget.onSelectionChanged!(_selectedItems);
                            }
                          }
                    : widget.onTap == null
                        ? null
                        : (_) => widget.onTap!(item),
                cells: labels.map(
                  (e) {
                    Widget? cell = widget.cellBuilder == null
                        ? null
                        : widget.cellBuilder!(item, e, labels.indexOf(e));
                    return DataCell(
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: equalRowWidth),
                        child: cell ?? Text(e, maxLines: 2),
                      ),
                    );
                  },
                ).toList(),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
