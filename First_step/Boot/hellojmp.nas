; hello-os
; TAB=4

    ORG    0x7c00            ; 

; standard FAT12 format floppy disk

    JMP   entry
    DB    0x90
    DB    "HELLOIPL"         ; boot sector, free to rename this sector
    DW    512                ; size of sector (bytes)
    DB    1                  ; size of clusters (one sector)
    DW    1                  ; number of sector reserved
    DB    2                  ; number of FAT tables of Disk
    DW    224                ; number of entry of root directory (normally 224 entry)
    DW    2880               ; total number of sector in Disk
    DB    0xf0               ; type of media (must 0xf0)
    DW    9                  ; sector num of one FAT table
    DW    18                 ; how many sector in one track
    DW    2                  ; number of head
    DD    0                  ; we don't use any partician
    DD    2880               ; rewrite the size of this disk
    DB    0,0,0x29           ; maybe useful later
    DD    0xffffffff         ; volume serial num
    DB    "HELLO-OS "        ; name of disk
    DB    "FAT12 "           ; name of format (8bytes)
    RESB  18                 ; just keep 18 bytes

; main of program

entry:

    MOV    AX, 0             ; initialize register
    MOV    SS, AX            ; SS (stack segment) = AX (accumulator)
    MOV    SP, 0x7c00        ; SP (stack pointer) = 0x7c00
    MOV    DS, AX            ; DS (data segment) = AX (accumulator)
    MOV    ES, AX            ; ES (extra segment) = AX (accumulator)

    MOV    SI, msg           ; msg means label

putloop:

    MOV    AL, [SI]
    ADD    SI, 1             ; SI + 1
    CMP    AL, 0             ; AL = character code
    JE     fin               ; fin label means fianl
    MOV    AH, 0x0e          ; one char expression possible
    MOV    BX, 15            ; color code
    INT    0x10              ; call video BIOS
    JMP    putloop

fin:

    HLT                      ; stop CPU
    JMP    fin               ; Endless loop

msg:
    DB     0x0a, 0x0a
    DB     "hello, os!"
    DB     0x0a
    DB     0

    RESB   0x7dfe-$

    DB     0x55, 0xaa
