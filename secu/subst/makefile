all: menu encrypt decrypt break

menu: menu.c encrypt decrypt break
	gcc menu.c -o menu

encrypt: subst_encrypt.c
	gcc subst_encrypt.c -o subst_encrypt -Wall

decrypt: subst_decrypt.c
	gcc subst_decrypt.c -o subst_decrypt -Wall

break: subst_break.c
	gcc subst_break.c -o subst_break -Wall
