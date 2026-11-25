import 'package:flutter/material.dart';
import 'package:flutter_contacts_session4/core/utils/contact_model.dart';

import '../widgets/contact_card.dart';
import '../widgets/customized_app_bar.dart';

class ContactsGridViewScreen extends StatelessWidget {
   const ContactsGridViewScreen({super.key,
  required this.cards,required this.onPressed});
   final List<ContactModel>cards;
   final  Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CustomizedAppBar(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) => ContactCard(
                  imagePath: cards[index].imagePath,
                  name: cards[index].name,
                  phone: cards[index].phone,
                  email: cards[index].email, onPressed: ()=>onPressed(index)
                ),
                itemCount: cards.length,
              ),
            ),
          ],
        ),);
  }
}
