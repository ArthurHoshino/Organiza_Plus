import 'package:flutter/material.dart';

class NameFormModal extends StatefulWidget {
  const NameFormModal();

  @override
  State<NameFormModal> createState() => NameFormModalState();
}

class NameFormModalState extends State<NameFormModal> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Insira a Tarefa'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Tarefa',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'A descrição não pode ser vazia.';
            }
            return null;
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Fecha o modal e retorna 'null' para indicar cancelamento
            Navigator.of(context).pop(null);
          },
          child: const Text('Cancelar'),
        ),
        // Botão Salvar
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop(_controller.text);
            }
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}