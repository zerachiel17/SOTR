#PURPOSE: This program finds the maximum number of a
#
# set of data items.
#
# %ebx - Largest data item found
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#
# to terminate the data
#
.section .data
#These are the data items
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
.section .text
.globl _start
_start:
movl $0, %edi
movl data_items(,%edi,4), %eax
movl %eax, %ebx
start_loop:
cmpl $0, %eax
je loop_exit
incl %edi
movl data_items(,%edi,4),%eax
cmpl %ebx, %eax
jle start_loop
movl %eax, %ebx
jmp start_loop
# move 0 into the index register
# load the first byte of data
# since this is the first item, %eax is
# the biggest
# check to see if we’ve hit the end
# load next value
# compare values
# jump to loop beginning if the new
# one isn’t bigger
# move the value as the largest
# jump to loop beginning
loop_exit:
# %ebx is the status code for the exit system call
# and it already has the maximum number
movl $1, %eax
#1 is the exit() syscall
int $0x80

