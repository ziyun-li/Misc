
# As the Cafe expands, they decide to increase the menu items. Unfortunately, there were too many orders that went unfulfilled. The Data Scientists request for some data so the Cafe Logistics Team may review how to better manage the inventory based on customer demand.
# You decide to write another bash script named unfulfilledOrders.sh to help the Data Scientists which will output the 3 most recent unfulfilled orders for the specified date and order, sorted by timestamp from oldest to newest.

# Your script should take in 3 command line arguments:
# •	Arg 1: absolute file path of the order list (eg input_unfulfilledorders.txt)
# •	Arg 2: the customer's order
# •	Arg 3: the order date in YYYY-MM-DD format

# Other Specifications
# 1. Order the dates from earliest to latest.
# 2. Display only the last 3 latest oders.


# Sample 1
# Command: ./unfulfilledOrders.sh input_unfulfilledorders.txt "STRAWBERRY SHORTCAKE" 2019-01-18
# Output:
# 2019-01-18 13:15:00 order="STRAWBERRY SHORTCAKE" fulfilled=FALSE
# 2019-01-18 15:30:00 order="STRAWBERRY SHORTCAKE" fulfilled=FALSE
# 2019-01-18 16:40:00 order="STRAWBERRY SHORTCAKE" fulfilled=FALSE
# Explanation:
# Lines 1-3, 6-7 and 10 contain STRAWBERRY SHORTCAKE orders on 2019-01-18
# Lines 1-3, and 10 contain unfulfilled (fulfilled=FALSE) orders
# Arrange lines 1-3 and 10 in ascending order, and the last 3 timings are 13:15:00, 15:30:00 and 16:40:00
# Sample 2
# Command: ./unfulfilledOrders.sh input_unfulfilledorders.txt "MILLE CREPE" 2019-01-18
# Output:
# 2019-01-18 10:15:00 order="MILLE CREPE" fulfilled=FALSE
# 2019-01-18 11:30:00 order="MILLE Crepe" fulfilled=FALSE
# Explanation:
# Lines 4-5 and 11 contain MILLE CREPE orders on 2019-01-18
# Lines 4 and 10 contain unfulfilled (fulfilled=FALSE) orders
# Arrange lines 4 and 10 in ascending order, and the last up to 3 timings are 10:15:00 and 11:30:00


#!/bin/bash

given_date="$3"

while read line;do
    date=${line:0:10}
    order=$(echo $line | cut -d'"' -f 2 | tr '[:lower:]' '[:upper:]')
    fulfilled=$(echo $line | cut -d'=' -f 3)
    if [ "$order" == "$2" -a "$date" == "$given_date" -a "$fulfilled" == "FALSE" ]; then
        echo $line
    fi
done < $1 | sort | tail -n 3
