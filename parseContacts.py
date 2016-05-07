#!/usr/bin/env python


import sys
from os import path


def main(input_file, output_file):
    with open(input_file, "r") as sqldump:
        with open(output_file, "w") as parsed:
            for line in sqldump:
                parsed.write(line.split('|')[1] + "\n")


if __name__ == "__main__":
    argv = sys.argv[1:]
    assert len(argv) is 2
    input_file  = argv[0]
    output_file = argv[1]
    assert path.isfile(input_file)
    assert path.isfile(output_file)
    main(input_file, output_file)

