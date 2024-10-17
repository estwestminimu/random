#!/bin/bash

# Ustawienie zmiennej do przechowywania liczby znaków (teraz 1000)
num_bits=500

# Tworzenie pliku wyjściowego
output_file="output.txt"

# Funkcja generująca grupę 3 liczb z co najmniej jedną "1"
generate_group_of_three() {
    local group=()
    # Losowe wartości dla dwóch pierwszych miejsc (mogą być 0, 1, lub 3)
    group[0]=$((RANDOM % 3)) # 0, 1 lub 2, zamienimy 2 na 3
    group[1]=$((RANDOM % 3)) 
    group[0]=$((group[0] == 2 ? 3 : group[0])) # Zamiana 2 na 3
    group[1]=$((group[1] == 2 ? 3 : group[1])) 

    # Trzecie miejsce ustawiane na 1, jeśli żadne z wcześniejszych nie jest 1
    if [[ "${group[0]}" != "1" && "${group[1]}" != "1" ]]; then
        group[2]=1
    else
        # Jeśli w grupie już jest "1", trzecie miejsce może być losowe
        group[2]=$((RANDOM % 3))
        group[2]=$((group[2] == 2 ? 3 : group[2])) # Zamiana 2 na 3
    fi

    # Zwrócenie wygenerowanej grupy
    echo "${group[0]},${group[1]},${group[2]}"
}

# Generowanie losowych bitów i zapisywanie ich do pliku
{
    echo -n "{ "  # Rozpoczęcie formatu
    for ((i=0; i<num_bits; i+=3)); do
        # Generowanie grupy 3 znaków
        group=$(generate_group_of_three)
        if [[ $i -gt 0 ]]; then
            echo -n ", $group"
        else
            echo -n "$group"
        fi
    done
    echo " }"  # Zakończenie formatu
} > "$output_file"

echo "Plik wygenerowany jako $output_file"
