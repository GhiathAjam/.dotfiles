#! /bin/bash

check() {
  # check if file doesn't exist
  if [[ ! -f $1 ]]; then
    echo "File $1 Not Found" 1>&2
    exit 1
  fi
}

check gen.cpp
check main.cpp
check brute.cpp

# compile files
g++ gen.cpp -o gen
g++ main.cpp -o main
g++ brute.cpp -o brute

for (( i = 0; i < 1000; i++ )); do
    # generate test
    ./gen > st_input.txt

    # run solution
    ./main < st_input.txt > st_output.txt

    # run brute
    ./brute < st_input.txt > output_brute.txt

    # compare outputs
    diff st_output.txt output_brute.txt > /dev/null

    # if outputs are different, print test to console
    if [[ $? -ne 0 ]]; then
        echo "Test $i failed"
        cat st_input.txt
        delta st_output.txt output_brute.txt
        break
    fi

    # print test number
    if (( i % 100 == 0 )); then
        echo "Test $i Done"
    fi
done

rm gen main brute output_brute.txt st_input.txt st_output.txt
