%include 'in_out.asm'
SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
res: DB 'Результат: ', 0
SECTION .bss
x: RESB 80
a: RESB 80
SECTION .text
GLOBAL _start
_start:
    ; Запрос и ввод значения x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov edi, eax    ; Сохранение x в edi

    ; Запрос и ввод значения a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov esi, eax    ; Сохранение a в esi

    ; Сравнение значений x и a
    cmp edi, esi    ; Сравнение x (edi) с a (esi)
    jl less_than_a  ; Если x < a, перейти на less_than_a

greater_or_equal_a:
    ; Если x >= a: результат = x + 10
    mov eax, edi    ; eax = x
    add eax, 10
    jmp print_result

less_than_a:
    ; Если x < a: результат = a + 10
    mov eax, esi    ; eax = a
    add eax, 10

print_result:
    ; Вывод результата
    mov edi, eax    ; Сохранение результата в edi для iprintLF
    mov eax, res    ; Сообщение "Результат: "
    call sprint
    mov eax, edi    ; Результат для печати
    call iprintLF
    call quit       ; Завершение программы
