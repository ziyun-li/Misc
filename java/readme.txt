The company have Defender Arcade within the company for employees. Since everyone is quite busy with work, everyone has provided the time (start time and finish time) when he or she wants to play games. If play time of two employees overlap then they start fighting and stop working. The boss got to know about this situation and asked you to help him by calculating the minimum number of Defender Arcades needed so that every employee can play during their specified time.

Write a function,countArcades,that takes in a list of employees' play times and returns the number of arcade machines needed.

Single integer denoting minimum number of Defender Arcade needed.
Sample Input:
900 910
940 1200
950 1120
1100 1130
1300 1400
1350 1420
Sample Output:
3
Explanation:
Between 1100 and 1120, there are 3 employees who wants to play, so a minimum of 3 Defender Arcades are needed.

Files in the folder
--------------------
DefenderArcade.java                 The file containing the countArcades function
Main.class                          Class containing the main() method
input1.txt                          Sample input file
run.sh                              Bash script to run Main.main()

Running the file
--------------------
1) Compile DefenderArcade.java into DefenderArcade.class
2) Run Main.main() which will call DefenderArcade. Running ./run.sh on terminal runs this file