    .data
promptL:    .asciiz "Enter the value of L greater than 20: "
promptM:    .asciiz "Enter the value of M greater than 20: "
promptN:    .asciiz "Enter the value of N greater than 20: "
error:  .asciiz "This is an illegal number!\n"

    .text
gcd:
    move $t0, $a0 # copy first num to $t0
    move $t1, $a1 # copy second num to $t1

gcd_loop:
    beq $t1, $zero, gcd_done
    rem $t2, $t0, $t1
    move $t0, $t1 # $t0 = $t1
    move $t1, $t2 # $t1 = $t2
    j gcd_loop
main:
