import 'package:flutter/material.dart';
import 'package:flutter_contacts_session4/core/constants/app_colors.dart';
import 'package:flutter_contacts_session4/core/utils/contact_model.dart';
import 'package:flutter_contacts_session4/ui/screens/contacts_grid_view_screen.dart';
import '../widgets/bottom_sheet_widget.dart';
import 'empty_state_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int maxCardsNumber = 6;
  List<ContactModel> cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        spacing: 10,
        mainAxisSize: .min,
        children: [
          if (cards.isNotEmpty)
            FloatingActionButton(
              heroTag: "deleteLastCard",
              onPressed: () {
                setState(() {
                  cards.removeLast();
                });
              },
              backgroundColor: AppColors.redOrange,
              child: const Icon(Icons.delete, color: AppColors.white),
            ),
          FloatingActionButton(
            heroTag: "addCard",
            onPressed: cards.length == maxCardsNumber
                ? null
                : () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: AppColors.darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      builder: (context) => BottomSheetWidget(
                        onAddContact: (newContact) {
                          if (cards.length < maxCardsNumber) {
                            setState(() {
                              cards.add(newContact);
                            });
                          }
                        },
                      ),
                    );
                  },
            backgroundColor: AppColors.gold,
            child: Icon(Icons.add, color: AppColors.darkBlue),
          ),
        ],
      ),
      backgroundColor: AppColors.darkBlue,
      body: cards.isEmpty
          ? EmptyStateScreen()
          : ContactsGridViewScreen(cards: cards, onPressed: (index) {
            setState(() {
              cards.removeAt(index);
            });
      }),
    );
  }
}
