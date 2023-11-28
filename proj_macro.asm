# Add you macro definition here - do not touch cs47_common_macro.asm"
#<------------------ MACRO DEFINITIONS ---------------------->#

# Macro : extract_nth_bit
# Usage : extract_nth_bit($regD, $regS, $regT)
        .macro extract_nth_bit($regD, $regS, $regT)
        srlv	$t0, $regS, $regT			# Right shift regS by regT, then store in $t0
        li	$t1, 1					# Mask = $t1 = 1
        and	$regD, $t0, $t1
        .end_macro 
        
# Macro : insert_to_nth_bit
# Usage : insert_to_nth_bit($regD, $regS, $regT, $maskReg){
        .macro insert_to_nth_bit($regD, $regS, $regT, $maskReg)
        li	$maskReg, 1						# Mask = 1
        sllv	$maskReg, $maskReg, $regS				# Shift mask by regS
        not 	$maskReg, $maskReg					# Invert mask
        and	$regD, $maskReg, $regD					# Mask regD with maskReg
        sllv	$t0, $regT, $regS					# Shift regT by regS
       	or	$regD, $regD, $t0					# Mask regD with $t0
        .end_macro