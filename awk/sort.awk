# @auth lemo.lu
# @data 2011.11.16
# use to sort the record with specific field

# BEGIN BLOCK
BEGIN{
    print "BEGIN SORT"
}


##############################################
# NR - number of records , start from 1
# NF - number of fields
# $0 - the whole line 
# $1,$2 - the first column as $1, the second column as $2
##############################################


NR==1 {  # if number of record equals to 1
    for (i=1; i<=NF; i++) { 
	if ( $i == fldName ) { 
	    fldNr = i 
	} 
    } 
    head = $0  # store field names that is store in first line
    next       # like continue
} 


# 32 - width => the result is padded with black spaces if the value to be printed
# is shorter than this number, There , if the length of sorted value is larger that 
# 32, the result will be wrong
{ values[NR] = sprintf("%32s%s", $fldNr, $0) } 


# END BLOCK
END { 
    n = asort(values) # sorts the content of values and return the number of elments in the array source, the default order is ascending.)
    print head 
    if( "des" == order)
    {
	for (i=n; i>=1; i--) { 
	    print substr(values[i],33)  # remove the sort values
	} 
    }
    else{
	for (i=1; i<=n; i++) { 
	    print substr(values[i],33)  # remove the sort values
	} 
    }
} 