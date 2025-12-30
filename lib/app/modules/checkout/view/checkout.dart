import 'package:flutter/material.dart';
import '../../../../state/app_state.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _note = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final app = AppStateScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Paiement')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Vos coordonnées', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Nom complet'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phone,
              decoration: const InputDecoration(labelText: 'Téléphone'),
              keyboardType: TextInputType.phone,
              validator: (v) => (v == null || v.trim().length < 8) ? 'Téléphone invalide' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _address,
              decoration: const InputDecoration(labelText: 'Adresse'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _note,
              decoration: const InputDecoration(labelText: 'Note (optionnel)'),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            Text('Résumé', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            for (final item in app.cart)
              ListTile(
                title: Text(item.product.name),
                subtitle: Text('${item.quantity} x ${item.product.price.toStringAsFixed(2)} €'),
                trailing: Text('${(item.product.price * item.quantity).toStringAsFixed(2)} €'),
              ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total'),
                Text('${app.totalPrice.toStringAsFixed(2)} €', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Commande confirmée'),
                    content: Text('Merci ${_name.text}, nous préparons votre commande.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                    ],
                  ),
                );
                app.clearCart();
                if (mounted) Navigator.pop(context);
              },
              icon: const Icon(Icons.lock_outline),
              label: const Text('Payer maintenant (simulation)'),
            )
          ],
        ),
      ),
    );
  }
}
