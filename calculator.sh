#!/bin/bash
add(){
    echo "scale=2; $1 + $2" | bc
}

subtract(){
    echo "scale=2; $1 - $2" | bc
}

multiply(){
    echo "scale=2; $1 * $2" | bc
}

division(){
    echo "scale=2; $1 / $2" | bc
}

echo "Enter two numbers:"
read num1
read num2

echo "Choose operation: 1) Add 2) Subtract 3) Multiply 4) Divide"
read operation

case $operation in
    1) result=$(add $num1 $num2);;
    2) result=$(subtract $num1 $num2);;
    3) result=$(multiply $num1 $num2);;
    4) result=$(division $num1 $num2);;
    *) echo "Invalid operation"; exit 1;;
esac

echo "The result is: $result"
