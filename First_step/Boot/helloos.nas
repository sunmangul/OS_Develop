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
    DB    0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
    DB    0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
    DB    0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
    DB    0xee, 0xf4, 0xeb, 0xfd

; part of message

    DB    0x0a, 0x0a         ; double line feed
    DB    "hello, world"
    DB    0x0a               ; line feed
    DB    0

    RESB  0x1fe-$            ; fill 0x00 till 0x001fe

    DB    0x55, 0xaa

; except boot sector part

    DB    0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    RESB  4600
    DB    0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    RESB  1469432
