
#!/bin/bash
echo -e "\n===================================="
echo -e "[   ** General Use calculator **   ]"
echo -e "[Usage :                           ]"
echo -e "[        Basic athematic operators ]"
echo -e "[        '+', '-' , '/' and '*'    ]"
echo -e "|_keywords :                       |"
echo -e "[   MS -> Save in memory           ]"
echo -e "[   MR -> Retrieve from memory     ]"
echo -e "[   C  -> Clear Results            ]"
echo -e "[   M+ -> Add in memory            ]"
echo -e "====================================\n"

# Main function to check the Operator value
main() {
	# Switch statement to select proper case with operator's value
        case $oprtr in
                "+")
			# op1 is the second operator
                        echo -e "Enter Operand: \c" $op1
                        read op1
								# Calling check() to verify if any keyword is used
			check
								# Mathematic Operation relative to $oprtr
                        re=$( expr $op + $op1 )
                        echo -e "   $op + $op1 =  $re"		# Showing Results
			op=$re					# saving result in memory
                        next					# Calling next function to mimic a loop until $oprtr = 'X'
                        ;;
                 "-")
                        echo -e "Enter Operand: \c" $op1
                        read op1
			check
                        re=$( expr $op - $op1 )
                        echo -e "   $op - $op1 =  $re"		# Showing Results
			op=$re					# saving result in memory
                        next					# Calling next function to mimic a loop until $oprtr = 'X'
                        ;;
                 "*")
                        echo -e "Enter Operand: \c" $op1
                        read op1
			check
                        re=$( expr $op \* $op1 )
                        echo -e "   $op * $op1 =  $re"
			op=$re
                        next
                        ;;
                 "/")
                        echo -e "Enter Operand: \c" $op1	# Reading Variable
                        read op1
			while [ $op1 -eq "0" ]; do						# While loop to check if second operand is '0'
				echo -e "Can't divide by zero. please re-enter divisor"
				echo -e "Enter Operand: \c" $op1
	                        read op1
			done
			check					# Calling check() to verify if a keyword is used
                        re=$( expr $op / $op1 )
                        echo -e "   $op / $op1 =  $re"
			op=$re					# saving in memory
                        next
                        ;;
                "MS" | "ms")
                        echo -e "   $op -> M"			# Keeping the stored results
                        next					# Moving to next()
                        ;;
                "c" | "C")
                        echo -e "   Results Cleared"
                        clr					# Calling clr() function to vanish results but store memory of operand
                        ;;
		"M+" | "m+")
			op=$re					# To add to memory using previous result with second operator
			re=$( expr $op1 + $op )
                        echo -e "   $op1 + $op = $re -> M"
                        next
			;;
                "MC" | "mc")
                        echo -e "   0 -> M"			# Adding Zero to memory
                        next
                        ;;
                "X" | "x")
                        echo -e "   Good Bye."			# Quitting program
                        exit 0
                        ;;
                *)						# Default switch if operator input is not recognized
                        echo -e "   Sorry, $oprtr is not a valid operator, please re-enter operator."
                        next
                        ;;
        esac
}

clr() {
	echo -e "Enter Operand: \c" $op		# Looping the first operand input again to clear inputs
        read op
	check					# checking if a keyword is called
	next					# moving on to next() for operator input
}

start() {
	echo -e "Enter Operand: \c" $op		# Start-up function of the script
	read op
	echo -e " Enter Opertor: \c" $oprtr
	read oprtr				# Getting both inputs i.e. Primary oprand and operator

}

check() {

# Switch Statement to Check if keyword 'Mr' or 'C' is called in Primary or secondary operand
	case $op in
		"MR" | "mr")
			op=$op1
	                echo -e "   M -> $op"
        	        next
			;;
		*)
			;;
	esac

	case $op1 in
        	"MR" | "mr")		# OR logic is utilized to minimize errors of syntax
                	op1=$op
	                echo -e "   M -> $op"
        	        ;;
		"C" | "c")
			op1=""		# resetting primary operand, if keyword C is detected
                	echo -e "   Results Cleared"
	                clr
        	        ;;
		*)
			;;
	esac
}

next() {
	echo -e " Enter Opertor: \c" $oprtr		# Next() fuction to mimic a loop
        read oprtr
	main						# Calling main
}

start			# Executes only on start-up of script
main "$@"		# Calling main initially

echo -e ""
