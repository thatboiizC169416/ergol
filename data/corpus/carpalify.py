#!/bin/env python3
""" Turn corpus texts into CarpalX-compatible texts. """

from sys import argv

SUBSTITUTIONS = {
    "é": "'s",
    "è": "'e",
    "à": "'a",
    "ù": "'u",
    "ç": "'c",
    "œ": "'o",
    "«": "'2",
    "»": "'3",
    "“": "'2",
    "”": "'3",
    "…": "'.",
    "'": "' ",
}

def parse_corpus(file_path):
    """ Check all symbols a text file and subst them if required. """
    output = ""
    with open(file_path, "r", encoding="utf-8") as file:
        for char in file.read():
            if char in SUBSTITUTIONS:
                output += SUBSTITUTIONS[char]
            else:
                output += char
        file.close()
    return output

if __name__ == "__main__":
    if len(argv) == 2:  # convert one file
        print(parse_corpus(argv[1]))
