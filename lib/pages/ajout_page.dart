import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:les_vagues/models/spot.dart';
import 'package:les_vagues/services/airtable_api.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/top_nav.dart';
import 'dart:typed_data';
import 'dart:io' show File;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class AjoutSpotPage extends StatelessWidget{
  //const AjoutSpotPage({super.key, required this.spot});
  const AjoutSpotPage({super.key});

  //final Spot spot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body: const AjoutSpotForm(),
      bottomNavigationBar: MyBottomNav(
        currentIndex: 0,
        onTap: (index) {},
      ),
    );

    throw UnimplementedError();
  }  
}

class AjoutSpotForm extends StatefulWidget{
  const AjoutSpotForm({super.key});

  @override
  State<AjoutSpotForm> createState() => _AjoutSpotFormState();
}

class _AjoutSpotFormState extends State<AjoutSpotForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers pour récupérer les textes
  // TO DO : modifier location pour que l'utilisateur y entre une vraie adresse, 
  //dont on viendra extraire ville, pays etc 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  double _difficulty = 1.0; // valeur par défaut
  String? _waveType;
  DateTime? _startDate;
  DateTime? _endDate;
  
  File? _selectedImageFile;     // pour mobile
  Uint8List? _selectedImageBytes; // pour web

  // Sélection date
  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  // Sélection image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1200, // réduit la taille
      maxHeight: 1200,
      imageQuality: 80, // compression
    );
    if (pickedFile != null) {
      if (kIsWeb){
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _selectedImageBytes = bytes;
        });
      } else {
        setState(() {
        _selectedImageFile = File(pickedFile.path);
        });
      }
    }
  }

  Future<String?> _uploadImage() async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('spots/${DateTime.now().millisecondsSinceEpoch}.jpg');
      
      if (kIsWeb && _selectedImageBytes != null) {
        await storageRef.putData(_selectedImageBytes!);
      } else if (_selectedImageFile != null) {
        await storageRef.putFile(_selectedImageFile!);
      } else {
        return null;  // aucune image
      }

      return await storageRef.getDownloadURL();
    } catch (e) {
      print("Erreur upload Firebase: $e");
      return null;
    }
  }

    // Champs séparés pour lisibilité
  Widget _buildDifficultyField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Difficulté"),
        RatingBar.builder(
          initialRating: _difficulty,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (rating) => setState(() => _difficulty = rating),
        ),
      ],
    );
  }

  Widget _buildWaveTypeField() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: "Type de vague"),
      value: _waveType,
      items: ["Beach Break", "Reef Break", "Point Break", "Outer Bank"]
          .map((wave) => DropdownMenuItem(value: wave, child: Text(wave)))
          .toList(),
      onChanged: (value) => setState(() => _waveType = value),
      validator: (value) =>
          value == null ? "Veuillez choisir un type de vague" : null,
    );
  }

  Widget _buildDateField(String label, DateTime? date, bool isStart) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        hintText: date == null
            ? "Choisir une date"
            : "${date.day}/${date.month}/${date.year}",
      ),
      onTap: () => _selectDate(context, isStart),
      validator: (value) => date == null ? "Veuillez choisir une date" : null,
    );
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.add_a_photo),
          label: const Text("Ajouter une photo"),
        ),
        const SizedBox(height: 8),
        if (_selectedImageBytes != null)
          Image.memory(_selectedImageBytes!, height: 150)
        else if (_selectedImageFile != null)
          Image.file(_selectedImageFile!, height: 150)
        else
          const Text("Pas d'image téléchargée",
                    style: TextStyle(fontStyle: FontStyle.italic)),    
      ],
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String imageUrl = "";

      // upload image si sélectionnée
      final uploadedUrl = await _uploadImage();
      if (uploadedUrl != null) {
          imageUrl = uploadedUrl;
      }

      final spot = Spot(
        name: _nameController.text,
        city: _locationController.text,
        country: "France", // TO DO à revoir avec le champ location : à séparer ou regrouper ?
        imageUrl: imageUrl, // pour stocker l'URL Firebase
        rating: _difficulty.toInt(),
        dateAdded: DateTime.now(),
        // dateAdded: DateTime.now().toIso8601String(),
        difficulty: _difficulty.toString(),
        waveType: _waveType ?? "",
        peakSeasonStart: _startDate!, 
        peakSeasonEnd: _endDate!,
        mapUrl: "",
      );
      
      try {
        await AirtableApi().createSpot(spot);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Spot ajouté avec succès")),
          );
          Navigator.pop(context); // retour à la liste
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Erreur: $e")),
          );
        }
      }

      // Pour test
      debugPrint("Spot ajouté: ${spot.name}, type: ${spot.waveType}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Ajouter un spot",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Champ Nom
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Nom du spot'),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Veuillez entrer un nom pour ce spot' : null,
            ),
            const SizedBox(height: 16),
            
            // Champ Localisation
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(hintText: 'Localisation'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un lieu pour votre spot';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Champ difficulté
            _buildDifficultyField(),
            const SizedBox(height: 16),

            // Champ type de vague
            _buildWaveTypeField(),
            const SizedBox(height: 16),

            // Champ Saison
            _buildDateField("Début de saison", _startDate, true),
            const SizedBox(height: 16),
            _buildDateField("Fin de saison", _endDate, false),
            const SizedBox(height: 16),

            // Champ Image
            _buildImagePicker(),
            const SizedBox(height: 16),

            // Bouton
            Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Ajouter'),
                ),
            ),
          ],
        ),
      ),
    );
  }
}