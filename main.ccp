//Sebastian Arroyo, Luisander Arroyo, Jerik Pereira

#include <iostream>
#include <string>   // Para usar getline
#include <stdexcept> // Para manejar excepciones

using namespace std;
int main() {
    const int DIAS = 7;
    int pasos[DIAS];
    int calorias[DIAS];
    int cantidadPasos = 0;
    int cantidadCal = 0;
    int promedioPasos, promedioCal, goalCal = 2700;
    int menuOpc, dietaOpc;
    string grupoMuscular;
    string ejercicios[3];
    bool volverMenu;

    try {
        do {
        
            cout << "Bienvenido a Fitness Tracker" << "\n";
            cout << "Que desea hacer?" << "\n";
            cout << "1 - Seguimiento de calorias por semana" << "\n";
            cout << "2 - Generar rutina de ejercicios" << "\n";
            cout << "3 - Generar dieta" << "\n";
            cout << "4 - Salir" << "\n";
            cin >> menuOpc;

            if (cin.fail()) {
                throw invalid_argument("Entrada invalida. Por favor ingresa un numero entero.");
            }

            cin.ignore(); // Para limpiar el buffer antes de usar getline

            //Sebastian Arroyo

            switch (menuOpc) {
            case 1:
                for (int i = 1; i <= 2; i++) {
                    cout << "\n" << "Calorias recomendadas a quemar en la semana " << i << ": " << goalCal << "\n";
                    cout << "Necesitas " << goalCal / 0.04 << " pasos para llegar a la meta" << "\n";

                    for (int j = 0; j < DIAS; ++j) {
                        cout << "Entra la cantidad de pasos de tu dia " << j + 1 << ": ";
                        cin >> pasos[j];
                        if (cin.fail() || pasos[j] < 0) {
                            throw invalid_argument("Por favor, ingresa un numero entero positivo para los pasos.");
                        }

                        cantidadPasos += pasos[j];
                        calorias[j] = static_cast<int>(pasos[j] * 0.04);
                        cout << "Las calorias quemadas en el dia de hoy fueron: " << calorias[j] << "\n";
                        cantidadCal += calorias[j];
                        cout << "\n";
                    }

                    cout << "Resumen de la semana: " << i << "\n";
                    cout << "Meta de calorias a quemar en la semana: " << goalCal << "\n";
                    cout << "Necesitabas " << goalCal / 0.04 << " pasos para llegar a la meta" << "\n";
                    cout << "Pasos dados en la semana: " << cantidadPasos << "\n";
                    cout << "Calorias quemadas en la semana: " << cantidadCal << "\n";
                    promedioPasos = cantidadPasos / DIAS;
                    cout << "Promedio de pasos por dia: " << promedioPasos << "\n";
                    promedioCal = cantidadCal / DIAS;
                    cout << "Promedio de calorias por dia: " << promedioCal << "\n";
                    cantidadPasos = 0;
                    cantidadCal = 0;
                }
               
                cout << "Volver al menu principal? (1 - Si, 0 - No)" << endl;
                cin >> volverMenu;
                if (!volverMenu) {
                    cout << "Saliendo del programa" << endl;
                    return 0;
                }
               
                break;

            //Jerik Pereira

            case 2:
                cout << "Que grupo muscular quisieras enfocarte en la rutina? (piernas, pecho, espalda, brazos, abdominales): ";
                getline(cin, grupoMuscular);
                 cin.ignore();  // Limpiar el buffer
                transform(grupoMuscular.begin(), grupoMuscular.end(), grupoMuscular.begin(), ::tolower);

                if (grupoMuscular.empty()) {
                    throw invalid_argument("El grupo muscular no puede estar vacio.");
                }

                switch (grupoMuscular[0]) {
                case 'p':
                    if (grupoMuscular == "piernas") {
                        ejercicios[0] = "Dos Series de 20 Sentadillas";
                        ejercicios[1] = "Tres Series de 15 Prensa de pierna";
                        ejercicios[2] = "Una Serie de 20 Loungues";
                    } else if (grupoMuscular == "pecho") {
                        ejercicios[0] = "Dos Series de 15 Press de banca";
                        ejercicios[1] = "Una Serie de 20 Flexiones";
                        ejercicios[2] = "Tres Series de 10 Aperturas con mancuernas";
                    } else {
                        throw invalid_argument("Grupo muscular no reconocido.");
                    }
                    break;
                case 'e':
                    if (grupoMuscular == "espalda") {
                        ejercicios[0] = "Dos Series de 15 Dominadas";
                        ejercicios[1] = "Tres Series de 10 Remo con Mancuernas";
                        ejercicios[2] = "Dos Series de 15 Peso Muerto";
                    } else {
                        throw invalid_argument("Grupo muscular no reconocido.");
                    }
                    break;
                case 'b':
                    if (grupoMuscular == "brazos") {
                        ejercicios[0] = "Dos Series de 25 Curl de Biceps";
                        ejercicios[1] = "Tres Series de 15 Extensiones de Triceps";
                        ejercicios[2] = "Dos Series de 10 Dominadas con Agarre Cerrado";
                    } else {
                        throw invalid_argument("Grupo muscular no reconocido.");
                    }
                    break;
                case 'a':
                    if (grupoMuscular == "abdominales") {
                        ejercicios[0] = "Dos Series de 15 Crunches";
                        ejercicios[1] = "Dos Series de 12 Planchas";
                        ejercicios[2] = "Tres Series de 10 Elevaciones de piernas";
                    } else {
                        throw invalid_argument("Grupo muscular no reconocido.");
                    }
                    break;
                default:
                    throw invalid_argument("Entrada invalida. Intentalo de nuevo.");
                }

                cout << "Rutina para " << grupoMuscular << ":\n";
                for (int i = 0; i < 3; ++i) {
                    cout << (i + 1) << ". " << ejercicios[i] << endl;
                }
               
                cout << "Volver al menu principal? (1 - Si, 0 - No)" << endl;
                cin >> volverMenu;
                if (!volverMenu) {
                    cout << "Saliendo del programa" << endl;
                    return 0;
                }
               
                break;

            //Luisander Arroyo

            case 3: {
                const string dietas[3][3] = {
                    {"Desayuno: Avena con frutas", "Almuerzo: Ensalada de pollo", "Cena: Pescado a la plancha con verduras"},
                    {"Desayuno: Yogur con granola", "Almuerzo: Sandwich de pavo", "Cena: Pechuga de pollo con arroz integral"},
                    {"Desayuno: Smoothie de proteinas", "Almuerzo: Pasta con carne", "Cena: Filete de ternera con papas horneadas"}
                };

                cout << "Que tipo de dieta saludable deseas?" << endl;
                cout << "1. Bajar de peso" << endl;
                cout << "2. Mantener peso saludable" << endl;
                cout << "3. Subir de peso" << endl;
                cin >> dietaOpc;

                if (cin.fail() || dietaOpc < 1 || dietaOpc > 3) {
                    throw out_of_range("Opcion de dieta no valida.");
                }

                cout << "Dieta seleccionada: " << endl;
                for (int i = 0; i < 3; ++i) {
                    cout << dietas[dietaOpc - 1][i] << endl;
                }

                cout << "Volver al menu principal? (1 - Si, 0 - No)" << endl;
                cin >> volverMenu;
                if (!volverMenu) {
                    cout << "Saliendo del programa" << endl;
                    return 0;
                }
                break;
            }

       

            case 4:
                cout << "Saliendo del programa\n";
                return 0;

            default:
                throw invalid_argument("Opcion no valida. Por favor selecciona entre 1 y 4.");
            }
        } while (menuOpc != 4);
    } catch (const invalid_argument &e) {
        cerr << "Error: " << e.what() << endl;
    } catch (const out_of_range &e) {
        cerr << "Error: " << e.what() << endl;
    } catch (...) {
        cerr << "Error desconocido. El programa se cerrara." << endl;
    }

    return 0;

