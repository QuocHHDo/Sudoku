; Quoc Do
; CSC 210
; Sudoku 12x12 Project

.model tiny

.data
border db '+----+----+----+----+----+----+----+----+----+----+----+----+$'

row1a db '3  |    | 5  |    $'
row1b db '2  |    |    |    $'
row1c db '9  | 12 |    | 11$'


row2a db '   | 11 |    |    $'
row2b db '   |    |    |    $'
row2c db '   |    | 4  |   $'


row3a db '4  |    |    | 2  $'
row3b db '6  | 9  |    | 11 $'
row3c db '   |    |    | 10$'

row4a db '2  |    |    | 7  $'
row4b db '   | 5  |    | 6  $'
row4c db '4  | 11 |    |   $'

row5a db '   |    | 4  | 8  $'
row5b db '   |    | 3  |    $'
row5c db '   | 5  |    | 6 $'

row6a db '   |    |    |    $'
row6b db '9  |    |    |    $'
row6c db '1  | 3  |    |   $'

row7a db '   |    | 12 | 4  $'
row7b db '   |    |    | 5  $'
row7c db '   |    |    |   $'

row8a db '8  |    | 3  |    $'
row8b db '   | 11 |    |    $'
row8c db '5  | 10 |    |   $'

row9a db '   |    | 10 | 6  $'
row9b db '1  |    | 9  |    $'
row9c db '12 |    |    | 8 $'

row10a db '1  |    |    |    $'
row10b db '8  |    | 11 | 12 $'
row10c db '7  |    |    | 5 $'

row11a db '   | 8  |    |    $'
row11b db '   |    |    |    $'
row11c db '   |    | 10 |   $'

row12a db '12 |    | 2  | 9  $'
row12b db '   |    |    | 1  $'
row12c db '   | 8  |    | 4  $'

sol1a db '3  | 7  | 5  | 10 $'
sol1b db '2  | 4  | 1  | 8  $'
sol1c db '9  | 12 | 6  | 11$'


sol2a db '6  | 11 | 9  | 12 $'
sol2b db '3  | 7  | 5  | 10 $'
sol2c db '8  | 2  | 4  | 1 $'


sol3a db '4  | 1  | 8  | 2  $'
sol3b db '6  | 9  | 12 | 11 $'
sol3c db '3  | 7  | 5  | 10$'

sol4a db '2  | 3  | 1  | 7  $'
sol4b db '10 | 5  | 8  | 6  $'
sol4c db '4  | 11 | 12 | 9 $'

sol5a db '9  | 12 | 4  | 8  $'
sol5b db '11 | 1  | 3  | 2  $'
sol5c db '10 | 5  | 7  | 6 $'

sol6a db '10 | 6  | 11 | 5  $'
sol6b db '9  | 12 | 4  | 7  $'
sol6c db '1  | 3  | 8  | 2 $'

sol7a db '11 | 9  | 12 | 4  $'
sol7b db '7  | 8  | 10 | 5  $'
sol7c db '2  | 6  | 1  | 3 $'

sol8a db '8  | 2  | 3  | 1  $'
sol8b db '12 | 11 | 6  | 4  $'
sol8c db '5  | 10 | 9  | 7 $'

sol9a db '7  | 5  | 10 | 6  $'
sol9b db '1  | 2  | 9  | 3  $'
sol9c db '12 | 4  | 11 | 8 $'

sol10a db '1  | 4  | 6  | 3  $'
sol10b db '8  | 10 | 11 | 12 $'
sol10c db '7  | 9  | 2  | 5 $'

sol11a db '5  | 8  | 7  | 11 $'
sol11b db '4  | 3  | 2  | 9  $'
sol11c db '6  | 1  | 10 | 12$'

sol12a db '12 | 10 | 2  | 9  $'
sol12b db '5  | 6  | 7  | 1  $'
sol12c db '11 | 8  | 3  | 4 $'

bwrow db '+-----------------------------------------------------------+$'
borderline db '| $'
borderline2 db ' | $'

again db 'Press any key to try again or press enter to see solution and quit: $'
welcome db 'WELCOME TO 12 x 12 SUDOKU BY QUOC DO$'
instructions2 db 'On the last empty slot, press ENTER to reveal solution or press SPACEBAR $'
count db 1
one db 1
rowcount db 1
instructions1 db 'RULE: Press SPACEBAR or ENTER to skip to next empty slot.$'
instructions3 db 'to start from top. On the board, use A for 10, B for 11, and C for 12. $'
space db '                                                                     $'
select1 db "Press 1 to Start Playing 12x12 Sudoku $" 
.code
org 100h

start:
mov ax, 0003h
int 10h

mov ah, 06h  
xor al, al     
xor cx, cx     
mov dx, 184fh  
mov bh, 1eh    
int 10h

call draw_menu

draw_menu:
push ax
push bx
push dx

mov ah,2
mov dh,5
mov dl,20
mov bh,0
int 10h
mov cx, 1           
int 10h
mov dx,offset welcome
mov ah,9
int 21h

mov ah,2
mov dh,9
mov dl,10
mov bh,0
int 10h
mov dx,offset select1
mov ah,9
int 21h

mov ah, 2
mov dh,13
mov dl,0
mov bh,0
int 10h                
mov dx, offset instructions1
mov ah, 9
int 21h

mov ah, 2
mov dh,16
mov dl,0
mov bh,0
int 10h                
mov dx, offset instructions2
mov ah, 9
int 21h

mov ah, 2
mov dh,18
mov dl,0
mov bh,0
int 10h                
mov dx, offset instructions3
mov ah, 9
int 21h

setting:
mov dl,0ffh
mov ah,6
int 21h

cmp al,'1'
je START1

jmp setting

to_end_menu:
call toWhiteOut_screen

toWhiteOut_screen:
push dx
push cx
push bx
push ax
push ds
push es
push di
push si
mov ax,0a000h
mov es,ax
mov cx,32000
mov ax,0
rep stosw
pop si
pop di
pop es
pop ds
pop ax
pop bx
pop cx
pop dx
ret
;;;;;;;;;;;;;;;;;;;;;;
START1:
call printboard

ask1:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 7
mov dh, 1
int 10h
mov rowcount, 2

a1:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask2
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount,3
je nextD
cmp rowcount, 5
je nextE
add dl,4
mov dh,1
cmp rowcount,9
je next1
cmp rowcount,12
je nextC
int 10h
jmp a1

nextD:
add dl,9
mov dh, 1
int 10h
mov rowcount,4
jmp a1

nextE:
add dl,9
mov dh,1
int 10h
mov rowcount, 6
jmp a1

next1:
add dl,10
mov dh,1
int 10h
mov rowcount,11
jmp a1

nextC:
jmp ask2

ask2:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 3
int 10h
mov rowcount,1

a2:
mov ah, 1
int 21h

add rowcount, 1
cmp rowcount, 12
jg ask3
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 2
je next3
cmp rowcount,11
je nextF
add dl, 5
mov dh, 3
int 10h
jmp a2

next3:
add dl, 10
mov dh, 3
int 10h
mov rowcount, 3
jmp a2

nextF:
add dl,10
mov dh,3
int 10h
mov rowcount, 12
jmp a2


ask3:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 7
mov dh, 5
int 10h
mov rowcount, 2

a3:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask4
mov ah, 2
mov bh, 0
cmp rowcount, 4
je next4
cmp rowcount, 8
je next5
cmp rowcount,12
je nextG
add dl, 5
mov dh, 5
int 10h
jmp a3

next4:
add dl, 20
mov dh, 5
int 10h
mov rowcount, 7
jmp a3

next5:
add dl, 10
mov dh, 5
int 10h
mov rowcount, 9
jmp a3

nextG:
jmp ask4


ask4:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 7
mov dh, 7
int 10h
mov rowcount, 2

a4:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask5
mov ah, 2
mov bh, 0
cmp rowcount, 4
je next6
cmp rowcount, 6
je nextH
cmp rowcount, 8
je nextI
je next7
add dl, 5
mov dh, 7
int 10h
jmp a4

next6:
add dl, 10
mov dh, 7
int 10h
mov rowcount, 5
jmp a4

nextH:
add dl,10
mov dh,7
int 10h
mov rowcount, 7
jmp a4

nextI:
add dl, 20
mov dh,7
int 10h
mov rowcount,11
jmp a4

next7:
jmp ask5


ask5:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 9
int 10h
mov rowcount, 1

a5:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask6
mov ah, 2
mov bh, 0
cmp rowcount, 3
je next8
cmp rowcount, 7
je next9
cmp rowcount, 10
je nextJ
cmp rowcount,12
je next10
add dl, 5
mov dh, 9
int 10h
jmp a5

next8:
add dl, 15
mov dh, 9
int 10h
mov rowcount, 5
jmp a5

next9:
add dl,10
mov dh, 9
int 10h
mov rowcount, 8
jmp a5

nextJ:
add dl, 10
mov dh, 9
int 10h
mov rowcount, 11
jmp a5

next10:
jmp ask6


ask6:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 11
int 10h
mov rowcount, 1

a6:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask7
mov ah, 2
mov bh, 0
cmp rowcount, 5
je next11
cmp rowcount, 9
je nextK
je next12 
add dl, 5
mov dh, 11
int 10h
jmp a6

next11:
add dl, 10
mov dh, 11
int 10h
mov rowcount, 6
jmp a6

nextK:
add dl, 15
mov dh, 11
int 10h
mov rowcount,11
jmp a6

next12:
jmp ask7

ask7:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 13
int 10h
mov rowcount, 1

a7:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask8
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 3
je next13
cmp rowcount, 8
je next14
add dl, 5
mov dh, 13
int 10h
jmp a7

next13:
add dl, 15
mov dh, 13
int 10h
mov rowcount, 5
jmp a7

next14:
add dl, 10
mov dh, 13
int 10h
mov rowcount, 9
jmp a7

ask8:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 7
mov dh, 15
int 10h
mov rowcount, 2

a8:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask9
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 3
je next15
cmp rowcount, 6
je nextL
cmp rowcount,9
je nextM
je next16
add dl, 5
mov dh, 15
int 10h
jmp a8

next15:
add dl, 10
mov dh, 15
int 10h
mov rowcount, 4
jmp a8

nextL:
add dl,10
mov dh,15
int 10h
mov rowcount, 7
jmp a8

nextM:
add dl,15
mov dh,15
int 10h
mov rowcount,11
jmp a8

next16:
jmp ask9


ask9:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 17
int 10h
mov rowcount, 1

a9:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask10
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 3
je next17
cmp rowcount, 7
je nextN
cmp rowcount,9
je nextO
cmp rowcount,12
je next18 
add dl, 5
mov dh, 17
int 10h
jmp a9

next17:
add dl, 20
mov dh, 17
int 10h
mov rowcount, 6
jmp a9

nextN:
add dl, 10
mov dh, 17
int 10h
mov rowcount, 8
jmp a9

nextO:
add dl,10
mov dh, 17
int 10h
mov rowcount,10
jmp a9

next18:
jmp ask10

ask10:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 7
mov dh, 19
int 10h
mov rowcount, 2

a10:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask11
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 5
je next19
cmp rowcount, 7
je next20
cmp rowcount,12
je next21
add dl, 5
mov dh, 19
int 10h
jmp a10

next19:
add dl, 10
mov dh, 19
int 10h
mov rowcount, 6
jmp a10

next20:
add dl, 20
mov dh, 19
int 10h
mov rowcount, 10
jmp a10

next21:
jg ask11

ask11:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 2
mov dh, 21
int 10h
mov rowcount, 1

a11:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg ask12
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 2
je next22
cmp rowcount, 11
je next23
add dl, 5
mov dh, 21
int 10h
jmp a11

next22:
add dl, 10
mov dh, 21
int 10h
mov rowcount, 3
jmp a11

next23:
add dl, 10
mov dh, 21
int 10h
mov rowcount, 12
jmp a11

ask12:
mov ah, 3
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
mov dl, 7
mov dh, 23
int 10h
mov rowcount, 2

a12:
mov ah, 1
int 21h
add rowcount, 1
cmp rowcount, 12
jg more
mov ah, 2
mov bh, 0
int 10h
mov ah, 2
mov bh, 0
cmp rowcount, 3
je next24
cmp rowcount, 8
je next25
cmp rowcount, 10
je next26
cmp rowcount, 12
je next27
add dl, 5
mov dh, 23
int 10h
jmp a12

next24:
add dl, 15
mov dh, 23
int 10h
mov rowcount, 5
jmp a12

next25:
add dl, 10
mov dh, 23
int 10h
mov rowcount, 9
jmp a12

next26:
add dl, 10
mov dh, 23
int 10h
mov rowcount,11
jmp a12

next27:
jmp more

more:
call enterkey
mov ah, 09h
mov bl, 10
mov cx, 67                  ; set color
int 10h
mov dx, offset again
mov ah, 9
int 21h
mov ah, 1
int 21h
cmp al, 13
je solquit
mov ah, 2
mov bh, 0
mov dl, 0
mov dh, 24
int 10h
mov dx, offset space
mov ah, 9
int 21h
jmp ask1

solquit:
call printsolboard
mov ah, 1
int 21h
mov ah, 4ch
int 21h

pwelcome proc
mov ah, 09h
mov bl, 10
mov cx, 75
int 10h
mov dx, offset welcome
mov ah, 9
int 21h
ret
pwelcome endp


enterkey proc
mov dx, 10
mov ah, 2
int 21h
mov dx, 13
mov ah, 2
int 21h
ret                                 ; start new line
enterkey endp


printborline proc
mov ah,09h
mov bl,9
mov cx, 1               ; set color
int 10h
mov dx, offset borderline       ; prepare to print
mov ah, 9
int 21h
ret
printborline endp


printborline2 proc
mov ah,09h
mov bl,9
mov cx, 2               ; set color
int 10h
mov dx, offset borderline2      ; prepare to print
mov ah, 9
int 21h
ret
printborline2 endp


printborder proc
mov ah,09h
mov bl,9
mov cx, 61              ; set color
int 10h
mov dx, offset border           ; prepare to print
mov ah, 9
int 21h
ret
printborder endp


printbwrow proc
mov ah,09h
mov bl,4
mov cx, 61                  ; set color
int 10h
mov dx, offset bwrow            ; prepare to print
mov ah, 9
int 21h
ret
printbwrow endp

printboard proc
mov ax, 0003h
int 10h

call enterkey
call pwelcome
call enterkey

call printborder
call enterkey
call printborline

mov dx, offset row1a
mov ah, 9
int 21h

call printborline

mov dx, offset row1b
mov ah, 9
int 21h

call printborline

mov dx, offset row1c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset row2a
mov ah, 9
int 21h

call printborline

mov dx, offset row2b
mov ah, 9
int 21h

call printborline

mov dx, offset row2c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset row3a
mov ah, 9
int 21h

call printborline

mov dx, offset row3b
mov ah, 9
int 21h

call printborline

mov dx, offset row3c
mov ah, 9
int 21h

call printborline2
call enterkey
call printborder
call enterkey
call printborline

mov dx, offset row4a
mov ah, 9
int 21h

call printborline

mov dx, offset row4b
mov ah, 9
int 21h

call printborline

mov dx, offset row4c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset row5a
mov ah, 9
int 21h

call printborline

mov dx, offset row5b
mov ah, 9
int 21h

call printborline

mov dx, offset row5c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset row6a
mov ah, 9
int 21h

call printborline

mov dx, offset row6b
mov ah, 9
int 21h

call printborline

mov dx, offset row6c
mov ah, 9
int 21h

call printborline2
call enterkey
call printborder
call enterkey
call printborline

mov dx, offset row7a
mov ah, 9
int 21h

call printborline

mov dx, offset row7b
mov ah, 9
int 21h

call printborline

mov dx, offset row7c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset row8a
mov ah, 9
int 21h

call printborline

mov dx, offset row8b
mov ah, 9
int 21h

call printborline

mov dx, offset row8c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset row9a
mov ah, 9
int 21h

call printborline

mov dx, offset row9b
mov ah, 9
int 21h

call printborline

mov dx, offset row9c
mov ah, 9
int 21h

call printborline2
call enterkey
call printborder
call enterkey
call printborline

mov dx, offset row10a
mov ah, 9
int 21h

call printborline

mov dx, offset row10b
mov ah, 9
int 21h

call printborline

mov dx, offset row10c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset row11a
mov ah, 9
int 21h

call printborline

mov dx, offset row11b
mov ah, 9
int 21h

call printborline

mov dx, offset row11c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset row12a
mov ah, 9
int 21h

call printborline

mov dx, offset row12b
mov ah, 9
int 21h

call printborline

mov dx, offset row12c
mov ah, 9
int 21h

call printborline2
call enterkey
call printborder

ret
printboard endp

printsolboard proc
mov ax, 0003h
int 10h

call enterkey
call pwelcome

call enterkey
call printborder
call enterkey
call printborline

mov dx, offset sol1a
mov ah, 9
int 21h

call printborline

mov dx, offset sol1b
mov ah, 9
int 21h

call printborline

mov dx, offset sol1c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol2a
mov ah, 9
int 21h

call printborline

mov dx, offset sol2b
mov ah, 9
int 21h

call printborline

mov dx, offset sol2c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol3a
mov ah, 9
int 21h

call printborline

mov dx, offset sol3b
mov ah, 9
int 21h

call printborline

mov dx, offset sol3c
mov ah, 9
int 21h

call printborline2
call enterkey
call printborder
call enterkey
call printborline

mov dx, offset sol4a
mov ah, 9
int 21h

call printborline

mov dx, offset sol4b
mov ah, 9
int 21h

call printborline

mov dx, offset sol4c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol5a
mov ah, 9
int 21h

call printborline

mov dx, offset sol5b
mov ah, 9
int 21h

call printborline

mov dx, offset sol5c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol6a
mov ah, 9
int 21h

call printborline

mov dx, offset sol6b
mov ah, 9
int 21h

call printborline

mov dx, offset sol6c
mov ah, 9
int 21h

call printborline2
call enterkey
call printborder
call enterkey
call printborline

mov dx, offset sol7a
mov ah, 9
int 21h

call printborline

mov dx, offset sol7b
mov ah, 9
int 21h

call printborline

mov dx, offset sol7c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol8a
mov ah, 9
int 21h

call printborline

mov dx, offset sol8b
mov ah, 9
int 21h

call printborline

mov dx, offset sol8c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline
;;;

mov dx, offset sol9a
mov ah, 9
int 21h

call printborline

mov dx, offset sol9b
mov ah, 9
int 21h

call printborline

mov dx, offset sol9c
mov ah, 9
int 21h

call printborline2
call enterkey
call printborder
call enterkey
call printborline

mov dx, offset sol10a
mov ah, 9
int 21h

call printborline

mov dx, offset sol10b
mov ah, 9
int 21h

call printborline

mov dx, offset sol10c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol11a
mov ah, 9
int 21h

call printborline

mov dx, offset sol11b
mov ah, 9
int 21h

call printborline

mov dx, offset sol11c
mov ah, 9
int 21h

call printborline2
call enterkey
call printbwrow
call enterkey
call printborline

mov dx, offset sol12a
mov ah, 9
int 21h

call printborline

mov dx, offset sol12b
mov ah, 9
int 21h

call printborline

mov dx, offset sol12c
mov ah, 9
int 21h

call printborline2
call enterkey
call printborder

ret
printsolboard endp

end start