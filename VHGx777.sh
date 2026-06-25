#!/bin/bash
#Aracımı kullananlar umarım pişman olmaz
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    clear
    figlet -f big "VHGx777"
    echo "   Geliştirici: VHG"
    echo "=============================================="
    echo -e "\e[1;36m        VHGx777 - KULLANICI ARACI\e[0m"
    echo "=============================================="
    echo ""
    echo -e "\e[1;32m 01) CallBomb\e[0m"
    echo -e "\e[1;32m 02) DDOS\e[0m"
    echo -e "\e[1;32m 03) SMS_BOMB\e[0m"
    echo -e "\e[1;32m 04) TigerVirus\e[0m"
    echo -e "\e[1;32m 05) holehe (E-posta OSINT)\e[0m"
    echo -e "\e[1;32m 06) sqlmap (SQL Enjeksiyon)\e[0m"
    echo -e "\e[1;32m 07) Zphisher (Phishing)\e[0m"
    echo -e "\e[1;32m 08) DarkFly\e[0m"
    echo -e "\e[1;31m 99) Çıkış\e[0m"
    echo ""
    echo "=============================================="
    read -p " Seçiminiz: " secim

    case $secim in
        01|1)
            echo "CallBomb çalıştırılıyor..."
            cd ~/VHGx777/CallBomb && python3 call_bomber.py
            sleep 1
            ;;
        02|2)
            echo "DDOS çalıştırılıyor..."
            cd ~/VHGx777/DDOS && python3 DRipper.py
            sleep 999999999
            ;;
        03|3)
            echo "SMS_BOMB çalıştırılıyor..."
            cd ~/VHGx777/SMS_BOMB && python3 LegacySMS.py
            sleep 1
            ;;
        04|4)
            echo "TigerVirus çalıştırılıyor..."
            cd ~/VHGx777/TigerVirus && bash TigerVirus.sh
            sleep 1
            ;;
        05|5)
            echo "holehe çalıştırılıyor..."
            read -p "E-posta adresi girin: " email
            holehe $email
            sleep 1
            ;;
        06|6)
            echo "sqlmap çalıştırılıyor..."
            cd ~/VHGx777/sqlmap && python3 sqlmap.py
            sleep 999999999
            ;;
        07|7)
            echo "Zphisher çalıştırılıyor..."
            cd ~/VHGx777/zphisher && bash zphisher.sh
            sleep 1
            ;;
        08|8)
            echo "DarkFly çalıştırılıyor..."
            DarkFly
            ;;
        99)
            echo "Çıkılıyor..."
            sleep 2
            echo "VHG sizi tekrar bekler..."
            sleep 2
            clear
            sleep 2
            exit 0
            ;;
        *)
            echo -e "\e[1;31mGeçersiz seçim!\e[0m"
            sleep 2
            echo "Lütfen Tekrar Deneyin"
            sleep 2
            ;;
    esac
done
#kendimi kandırmayacam bu benim ilk aracım
#Ama hernyese Tool'lumun keyfini çıkarın
