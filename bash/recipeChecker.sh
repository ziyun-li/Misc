# You have a cafe which serves 3 items, with the following ingredients required:
# •	APPLE PIE - 3x Apple
# •	PINEAPPLE PIE - 3x Pineapple
# •	FRUIT PARFAIT - 2x Apple + 2x Pineapple

# You are an inventory manager in charge of checking if we can fulfill a customer's orders with the ingredients we have in stock. Luckily, the inventory list is contained in a text file. Write a bash script named recipeChecker.sh which will let us know if we can fulfill the order.
# Your script should take in 2 command line arguments:
# •	Arg 1: absolute file path of the inventory list (e.g. fruitList.txt )
# •	Arg 2: the customer's order consisting only one of ["APPLE PIE", "PINEAPPLE PIE" or "FRUIT PARFAIT"] in BLOCK letters
# Your script should output the following to stdout:
# •	If there are enough ingredients to create the specified dessert, output exactly :  You shall have (recipe name )!
# •	Else, output: You shall not have (recipe name )
# •	If an unrecognised recipe is provided (eg Pineapple Pie), output:  We do not have that on the menu


# To run: ./recipeChecker.sh input_recipechecker.txt "ITEM NAME".
# Example: ./recipeChecker.sh input_recipechecker.txt "APPLE PIE"  ./recipeChecker.sh input_recipechecker.txt "CHICKEN PIE"

#!/bin/bash
apple_count=0
pineapple_count=0

while read line;do
    chrlen=${#line}-1
    line=$(echo "${line:0:chrlen}" | tr '[:upper:]' '[:lower:]')
    if [ "$line" == "apple" ]; then
        ((apple_count++))

    elif [ "$line" == "pineapple" ]; then
        ((pineapple_count++))
    fi
done < $1

status=""
if [ "$2" == "APPLE PIE" ]; then
    if [ "$apple_count" -ge 3 ]; then
        status="Available"
    fi
elif [ "$2" == "PINEAPPLE PIE" ]; then
    if [ "$pineapple_count" -ge 3 ]; then
        status="Available"
    fi
elif [ "$2" == "FRUIT PARFAIT" ]; then
    if [ "$pineapple_count" -ge 2 -a "$apple_count" -ge 2 ]; then
        status="Available"
    fi
else
    status="Not_in_Menu"
fi


if [ "$status" == "Available" ]; then
    echo "You shall have $2!"
elif [ "$status" == "Not_in_Menu" ]; then
    echo "We do not have that on the menu"
else
    echo "You shall not have $2"
fi
