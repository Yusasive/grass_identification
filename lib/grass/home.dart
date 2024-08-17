import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'plant_descriptions.dart'; // Import the file with plant descriptions

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = false; // Initialize as false
  File? _image;
  List<String>? _plantNames;
  List<List<TextSpan>>? _plantDescriptions;
  final picker = ImagePicker();
  final TextEditingController _searchController = TextEditingController();
  final String _apiKey =
      '6C0PPKArcPc9cTrVALGteosrucHFu3DupKG6SdqwMsZdHKFPhW'; // Replace with your actual API key
  final double _confidenceThreshold = 0.5;

  final List<String> _poaceaeSpecies = [
    'Zea mays',
    'Oryza sativa',
    'Hordeum vulgare',
    'Triticum aestivum',
    'Avena sativa',
    'Secale cereale',
    'Sorghum bicolor',
    'Panicum miliaceum',
    'Setaria italica',
    'Echinochloa esculenta',
    'Pennisetum glaucum',
    'Saccharum officinarum',
    'Cenchrus americanus',
    'Cynodon dactylon',
    'Lolium perenne',
    'Festuca arundinacea',
    'Dactylis glomerata',
    'Phleum pratense',
    'Poa pratensis',
    'Agrostis stolonifera',
    'Bromus inermis',
    'Alopecurus pratensis',
    'Deschampsia cespitosa',
    'Koeleria macrantha',
    'Brachypodium pinnatum',
    'Arrhenatherum elatius',
    'Holcus lanatus',
    'Molinia caerulea',
    'Arundo donax',
    'Miscanthus giganteus',
    'Phalaris arundinacea',
    'Phragmites australis',
    'Calamagrostis epigejos',
    'Sorghastrum nutans',
    'Spartina alterniflora',
    'Schizachyrium scoparium',
    'Andropogon gerardii',
    'Bouteloua gracilis',
    'Eragrostis tef',
    'Chloris gayana',
    'Digitaria sanguinalis',
    'Eleusine indica',
    'Cenchrus ciliaris',
    'Bothriochloa ischaemum',
    'Sporobolus airoides',
    'Stipa tenuissima',
    'Nassella trichotoma',
    'Aristida purpurea',
    'Eriochloa villosa',
    'Leptochloa dubia',
    'Cortaderia selloana',
    'Achnatherum hymenoides',
    'Melica ciliata',
    'Briza media',
    'Tridens flavus',
    'Paspalum notatum',
    'Axonopus compressus',
    'Zoysia japonica',
    'Sporobolus cryptandrus',
    'Muhlenbergia capillaris',
    'Schizachyrium littorale',
    'Digitaria didactyla',
    'Miscanthus sinensis',
    'Aristida stricta',
    'Chasmanthium latifolium',
    'Buchloe dactyloides',
    'Bouteloua curtipendula',
    'Cymbopogon citratus',
    'Imperata cylindrica',
    'Tripsacum dactyloides',
    'Phragmites karka',
    'Poa annua',
    'Phalaris canariensis',
    'Cymbopogon nardus',
    'Sporobolus virginicus',
    'Leersia oryzoides',
    'Zoysia matrella',
    'Spartina patens',
    'Paspalum dilatatum',
    'Bromus catharticus',
    'Lolium multiflorum',
    'Festuca ovina',
    'Bromus hordeaceus',
    'Festuca rubra',
    'Deschampsia flexuosa',
    'Aristida basiramea',
    'Bouteloua dactyloides',
    'Chloris virgata',
    'Setaria viridis',
    'Echinochloa crus-galli',
    'Pennisetum purpureum',
    'Cenchrus echinatus',
    'Bothriochloa bladhii',
    'Hyparrhenia rufa',
    'Urochloa brizantha',
    'Megathyrsus maximus',
    'Eragrostis curvula',
    'Eriochloa procera',
    'Aegilops cylindrica',
    'Aegilops triuncialis',
    'Aegilops tauschii',
    'Secale montanum',
    'Triticum monococcum',
    'Triticum durum',
    'Triticum turgidum',
    'Triticum dicoccum',
    'Triticum dicoccoides',
    'Avena barbata',
    'Avena fatua',
    'Avena sterilis',
    'Avena byzantina',
    'Avena brevis',
    'Hordeum murinum',
    'Hordeum bulbosum',
    'Hordeum jubatum',
    'Hordeum marinum',
    'Panicum capillare',
    'Panicum virgatum',
    'Panicum antidotale',
    'Setaria pumila',
    'Setaria parviflora',
    'Pennisetum clandestinum',
    'Cenchrus longispinus',
    'Cenchrus myosuroides',
    'Echinochloa colona',
    'Echinochloa frumentacea',
    'Echinochloa oryzoides',
    'Panicum repens',
    'Panicum turgidum',
    'Sorghum halepense',
    'Sorghum verticilliflorum',
    'Sorghum arundinaceum',
    'Sorghum propinquum',
    'Sorghum virgatum',
    'Sorghum exstans',
    'Paspalum urvillei',
    'Paspalum vaginatum',
    'Paspalum scrobiculatum',
    'Paspalum caespitosum',
    'Paspalum laeve',
    'Paspalum plicatulum',
    'Paspalum floridanum',
    'Paspalum distichum',
    'Paspalum conjugatum',
    'Paspalum paniculatum',
    'Axonopus fissifolius',
    'Axonopus affinis',
    'Axonopus compressus',
    'Axonopus furcatus',
    'Axonopus scoparius',
    'Axonopus univaginatus',
    'Zoysia tenuifolia',
    'Zoysia macrantha',
    'Zoysia sinica',
    'Zoysia japonica var. macrostachya',
    'Zoysia matrella var. pacifica',
    'Zoysia matrella var. luxurians',
    'Poa fendleriana',
    'Poa secunda',
    'Poa trivialis',
    'Poa compressa',
    'Poa palustris',
    'Poa nemoralis',
    'Poa bulbosa',
    'Poa glauca',
    'Poa laxa',
    'Poa pratensis subsp. alpigena',
    'Poa trivialis subsp. agrestis',
    'Agrostis gigantea',
    'Agrostis canina',
    'Agrostis capillaris',
    'Agrostis clavata',
    'Agrostis castellana',
    'Agrostis stolonifera subsp. grandis',
    'Agrostis tenuis',
    'Bromus sterilis',
    'Bromus japonicus',
    'Bromus erectus',
    'Bromus tomentellus',
    'Bromus mollis',
    'Bromus racemosus',
    'Bromus alopecuros',
    'Alopecurus myosuroides',
    'Alopecurus aequalis',
    'Alopecurus geniculatus',
    'Alopecurus pratensis var. villosus',
    'Alopecurus arundinaceus',
    'Alopecurus alpinus',
    'Alopecurus carolinianus',
    'Deschampsia caespitosa',
    'Deschampsia antarctica',
    'Deschampsia elongata',
    'Deschampsia cespitosa subsp. beringensis',
    'Deschampsia flexuosa subsp. gallica',
    'Deschampsia rigida',
    'Koeleria pyramidata',
    'Koeleria cristata',
    'Koeleria macrantha',
    'Koeleria vallesiana',
    'Brachypodium distachyon',
    'Brachypodium sylvaticum',
    'Brachypodium pinnatum subsp. rupestre',
    'Brachypodium retusum',
    'Brachypodium phoenicoides',
    'Brachypodium ramosum',
    'Arrhenatherum elatius subsp. bulbosum',
    'Holcus lanatus var. mollis',
    'Molinia caerulea subsp. arundinacea',
    'Arundo donax var. versicolor',
    'Miscanthus sinensis var. zebrinus'
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> detectImage(File image) async {
    setState(() {
      _loading = true; // Set loading to true when starting to process the image
    });

    try {
      http.Response response = await _sendImageToPlantId(image);
      final data = jsonDecode(response.body);

      if (response.statusCode == 201 && data != null) {
        final suggestions = data['result']['classification']['suggestions'];

        if (suggestions != null && suggestions.isNotEmpty) {
          final filteredSuggestions = suggestions.where((suggestion) {
            return suggestion['probability'] >= _confidenceThreshold &&
                _poaceaeSpecies.contains(suggestion['name']);
          }).toList();

          if (filteredSuggestions.isNotEmpty) {
            filteredSuggestions.sort((a, b) {
              final probabilityA = a['probability'] as double;
              final probabilityB = b['probability'] as double;
              return probabilityB.compareTo(probabilityA);
            });

            setState(() {
              _plantNames = List<String>.from(
                  filteredSuggestions.map((plant) => plant['name'] as String));
              _plantDescriptions =
                  List<List<TextSpan>>.from(filteredSuggestions.map((plant) {
                final plantName = plant['name'] as String;
                final profile = plantProfiles[plantName];
                if (profile != null) {
                  return [
                    TextSpan(
                        text: 'Common Name: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${profile.commonName}\n'),
                    TextSpan(
                        text: 'Scientific Name: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${profile.scientificName}\n'),
                    TextSpan(
                        text: 'Description: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${profile.description}\n'),
                    TextSpan(
                        text: 'Growth Habits: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${profile.growthHabits}\n'),
                    TextSpan(
                        text: 'Ecological Roles: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${profile.ecologicalRoles}\n'),
                    TextSpan(
                        text: 'Uses: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${profile.uses}\n'),
                  ];
                } else {
                  return [TextSpan(text: 'No description available')];
                }
              }));
              _loading = false; // Set loading to false after processing is done
            });
          } else {
            setState(() {
              _plantNames = ['Not found to be a Poaceae family'];
              _plantDescriptions = null;
              _loading = false; // Set loading to false if no match is found
            });
          }
        } else {
          throw Exception('No suggestions available from the API');
        }
      } else {
        throw Exception('Failed to detect image');
      }
    } catch (e) {
      _showErrorDialog('Error detecting image: $e');
      setState(() {
        _loading = false; // Ensure loading is set to false in case of error
      });
    }
  }

  Future<http.Response> _sendImageToPlantId(File image) async {
    final url = 'https://plant.id/api/v3/identification';

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers['Api-Key'] = _apiKey
      ..headers['Content-Type'] = 'application/json'
      ..fields['images'] = jsonEncode([base64Encode(await image.readAsBytes())])
      ..fields['similar_images'] = 'true';

    final response = await request.send();
    final responseBody = await http.Response.fromStream(response);

    if (responseBody.statusCode != 201) {
      throw Exception('Failed to detect image');
    }

    return responseBody;
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile == null) return;

      setState(() {
        _image = File(pickedFile.path);
      });

      detectImage(_image!);
    } catch (e) {
      _showErrorDialog('Error picking image: $e');
    }
  }

  Future<void> pickGalleryImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      setState(() {
        _image = File(pickedFile.path);
      });

      detectImage(_image!);
    } catch (e) {
      _showErrorDialog('Error picking image: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<String> _getSuggestions(String query) {
    List<String> matches = [];
    plantProfiles.forEach((key, value) {
      if (key.toLowerCase().contains(query.toLowerCase()) ||
          value.commonName.toLowerCase().contains(query.toLowerCase())) {
        matches.add(key);
      }
    });
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                'Poaceae Grasses',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontFamily: "Signatra",
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Poaceae Grasses Recognizer App',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  fontFamily: "Signatra",
                ),
              ),
              SizedBox(height: 20),
              TypeAheadField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search for plants...',
                    border: OutlineInputBorder(),
                  ),
                ),
                suggestionsCallback: (pattern) {
                  return _getSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    _searchController.text = suggestion;
                  });

                  final profile = plantProfiles[suggestion];

                  if (profile != null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(profile.commonName),
                          content: SingleChildScrollView(
                            // Enables scrolling if the content is too long
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Scientific Name: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '${profile.scientificName}\n'),
                                  TextSpan(
                                    text: 'Description: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '${profile.description}\n'),
                                  TextSpan(
                                    text: 'Growth Habits: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '${profile.growthHabits}\n'),
                                  TextSpan(
                                    text: 'Ecological Roles: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: '${profile.ecologicalRoles}\n'),
                                  TextSpan(
                                    text: 'Uses: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '${profile.uses}\n'),
                                ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Not Found'),
                          content: Text(
                              'No information available for the selected grass.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              _loading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _plantNames != null &&
                              _plantDescriptions != null
                          ? _plantNames!.asMap().entries.map((entry) {
                              final index = entry.key;
                              final name = entry.value;
                              final description = _plantDescriptions![index];
                              return ListTile(
                                title: Text(name),
                                subtitle: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: description,
                                  ),
                                ),
                              );
                            }).toList()
                          : [],
                    ),
              SizedBox(height: 20),
              _image != null
                  ? Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/leaf.png'),
                          SizedBox(height: 50),
                          Text('No image selected.'),
                        ],
                      ),
                    ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Camera',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: pickGalleryImage,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo_library, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Gallery',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
