

class Question {
  final int? id;
  final int? answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.answer, this.question, this.options});
}

const List questions = [
  {
    "id": 1,
    "question":
        "¿Cuánto tiempo lleva COOMULDESA al servicio de la comunidad santandereana?",
    "options": ["50 años", "60 meses", "60 años", "58 años"],
    "answer": 2,
  },

  {
    "id": 2,
    "question":
    "¿Cuál es el nombre del pueblo al que COOMULDESA ha estado sirviendo desde hace 16 años?",
    "options": ["Boyacense", "Santandereano", "Costeño", "Antioqueño"],
    "answer": 0,
  },
  {
    "id": 3,
    "question": "¿Cuál es la fecha de fundación de COOMULDESA?",
    "options": [
      "20 de octubre de 1950",
      "29 de junio de 1962",
      "23 de agosto de 1960",
      "29 de julio de 1962"
    ],
    "answer": 1,
  },
  {
    "id": 4,
    "question":
    "¿Cuál es el nombre del Presbítero que lideró la fundación de COOMULDESA?",
    "options": [
      "José Antonio Galán",
      "María Antonia Santos Plata",
      "Mario Galán Gómez",
      "Marco Fidel Reyes Afanador"
    ],
    "answer": 3,
  },
  {
    "id": 5,
    "question":
    "¿Cuál es el número de oficinas y corresponsales de COOMULDESA, en los departamentos de Santander y Boyacá?",
    "options": [
      "17 y 31 respectivamente",
      "37 y 11 respectivamente",
      "31 y 17 respectivamente",
      "17 y 27 respectivamente"
    ],
    "answer": 2,
  },
];
