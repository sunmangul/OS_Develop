; hello-os
; TAB=4

; standard FAT12 format floppy disk

    DB    0xeb, 0x4e, 0x90
    DB    "HELLOIPL"        ; boot sector, free to rename this sector
    DW    512               ; size of sector (bytes)
    DB    1                 ; size of clusters (one sector)
    DW    1                 ; number of sector reserved
    DB    2                 ; number of FAT tables of Disk
    DW    224               ; number of entry of root directory (normally 224 entry)
    DW    2880              ; total number of sector in Disk
    DB    0xf0              ; type of media (must 0xf0)
    DW    9                 ; sector num of one FAT table
    DW    18                ; how many sector in one track
    DW    2                 ; number of head
    DD    0                 ; we don't use any partician
    DD    2880              ; rewrite the size of this disk
    DB    0,0,0x29          ; maybe useful later
    DD    0xffffffff        ; volume serial num
    DB    "HELLO-OS "       ; name of disk
    DB    "FAT12 "          ; name of format (8bytes)
    RESB  18                ; just keep 18 bytes

; main of program
    DB    0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
