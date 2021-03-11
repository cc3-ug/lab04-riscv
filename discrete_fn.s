.rodata

f_neg3:   .asciiz "f(-3) should be 6, and it is: "
f_neg2:   .asciiz "f(-2) should be 61, and it is: "
f_neg1:   .asciiz "f(-1) should be 17, and it is: "
f_zero:   .asciiz "f(0) should be -38, and it is: "
f_pos1:   .asciiz "f(1) should be 19, and it is: "
f_pos2:   .asciiz "f(2) should be 42, and it is: "
f_pos3:   .asciiz "f(3) should be 5, and it is: "

output: .word 6, 61, 17, -38, 19, 42, 5

.text
.global __start

__start:
  la a0, f_neg3
  jal print_str
  li a0, -3
  jal f    # evaluate f(-3); should be 6
  jal print_int
  jal print_newline

  la a0, f_neg2
  jal print_str
  li a0, -2
  jal f    # evaluate f(-2); should be 61
  jal print_int
  jal print_newline

  la a0, f_neg1
  jal print_str
  li a0, -1
  jal f    # evaluate f(-1); should be 17
  jal print_int
  jal print_newline

  la a0, f_zero
  jal print_str
  li a0, 0
  jal f    # evaluate f(0); should be -38
  jal print_int
  jal print_newline

  la a0, f_pos1
  jal print_str
  li a0, 1
  jal f    # evaluate f(1); should be 19
  jal print_int
  jal print_newline

  la a0, f_pos2
  jal print_str
  li a0, 2
  jal f    # evaluate f(2); should be 42
  jal print_int
  jal print_newline

  la a0, f_pos3
  jal print_str
  li a0, 3
  jal f    # evaluate C(4,0); should be 5
  jal print_int
  jal print_newline

  li a0, 10
  ecall

# calculate f(a0)
f:
  la  t0, output  # Hmm... why might this be a good idea?

  # YOUR CODE GOES HERE!

  jr  ra  # Always remember to jr ra after your function!

print_int:
  mv a1, a0
  li  a0, 1
  ecall
  jr ra

print_str:
  mv a1, a0
  li a0, 4
  ecall
  jr ra

print_newline:
  li a1, '\n'
  li a0, 11
  ecall
  jr ra
