#!/bin/bash

clear

# bu VHG terminal kulanıcısı tarafından yapılmıştır
figlet -f big "VHGx777"
			echo Geliştirici: Vedatcan
echo "=============================================="
echo "        VHGx777 - KULLANICI ARACI"
echo "=============================================="
echo ""
echo "  1) CallBomb"
echo "  2) DDOS"
echo "  3) SMS_BOMB"
echo "  4) TigerVirus"
echo "  5) holehe (E-posta OSINT)"
echo "  6) sqlmap (SQL Enjeksiyon)"
echo "  7) Zphisher (Phishing)"
echo "  8) DarkFly"
echo " 99) Çıkış"
echo ""
echo "=============================================="
read -p " Seçiminiz: " secim

case $secim in

    1)
        echo "CallBomb çalıştırılıyor..."
        clear
        cd ~/CallBomb && python3 call_bomber.py
        ;;
    2)
        echo "DDOS aracı çalıştırılıyor..."
        clear
        cd ~/DDOS && python3 DRipper.py
        ;;
    3)
        echo "SMS_BOMB çalıştırılıyor..."
        clear
        cd ~/SMS_BOMB && python3 LegacySMS.py
        ;;
    4)
        echo "TigerVirus çalıştırılıyor..."
        clear
        cd ~/TigerVirus && bash TigerVirus.sh
        ;;
    5)
        echo "holehe çalıştırılıyor..."
        read -p "E-posta adresi girin: " email
        holehe $email
        ;;
    6)
        echo "sqlmap çalıştırılıyor..."
        cd ~/sqlmap && python3 sqlmap.py
        ;;
    7)
        echo "Zphisher çalıştırılıyor..."
        cd ~/zphisher && bash zphisher.sh
        ;;
    8)
        echo "DarkFly çalıştırılıyor..."
        DarkFly
        ;;
    99)
        echo "Çıkılıyor..."
        sleep 2
 	clear
        exit 0
        ;;
    *)
        echo "Geçersiz seçim!"
	sleep 1
	echo "Lütfen tekrar deneyin"
	sleep 2
	bash VHGx777.sh
	;;
esac

#Gelçi bunu nekadar ileri götürürüm bilmiyorum
