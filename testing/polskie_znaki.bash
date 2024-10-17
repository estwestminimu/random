#!/bin/bash

# Sprawdź, czy podano nazwę pliku jako argument
if [ -z "$1" ]; then
    echo "Użycie: $0 nazwa_pliku"
    exit 1
fi

# Sprawdź, czy plik istnieje
if [ ! -f "$1" ]; then
    echo "Plik $1 nie istnieje."
    exit 1
fi

# Polskie znaki diakrytyczne (zarówno małe, jak i wielkie)
polskie_znaki="ąćęłńóśźżĄĆĘŁŃÓŚŹŻ"

# Sprawdzenie, czy w pliku są polskie znaki
if grep -q "[$polskie_znaki]" "$1"; then
    echo "Plik zawiera polskie znaki."
else
    echo "Plik nie zawiera polskich znaków."
fi
