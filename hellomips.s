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

gcd_done:
    move $v0, $t0 # GCD is in $v0
    jr $ra

main:

input_L:
    li $v0, 4
    la $a0, promptL
    syscall
    li $v0, 5
    syscall
    blt $v0, 21, input_L # check if L is greater than 20
    move $s0, $v0 # save L in $s0

input_M:
    li $v0, 4
    la $a0, promptM
    syscall
    li $v0, 5
    syscall
    blt $v0, 21, input_M
    move $s1, $v0

input_N:
    li $v0, 4
    la $a0, promptN
    syscall
    li $v0, 5
    syscall
    blt $v0, 21, input_N
    move $s2, $v0

    # check for illegal numms
    blt $s0, 1, illegal_error
    blt $s1, 1, illegal_error
    blt $s2, 1, illegal_error
    j calculate_gcd

illegal_error:
    li $v0, 4
    la $a0, error
    syscall
    j main

calculate_gcd:
    move $a0, $s0
    move $a1, $s1
    jal gcd
    move $s3, $v0

    li $v0, 1
    move $a0, $s3
    syscall

    li $v0, 10
    syscall
