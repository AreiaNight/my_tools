#!/bin/bash

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

cat << "EOF"

 ▄▄▄       ██▀███  ▓█████  ██▓ ▄▄▄       ███▄    █  ██▓  ▄████  ██░ ██ ▄▄▄█████▓
▒████▄    ▓██ ▒ ██▒▓█   ▀ ▓██▒▒████▄     ██ ▀█   █ ▓██▒ ██▒ ▀█▒▓██░ ██▒▓  ██▒ ▓▒
▒██  ▀█▄  ▓██ ░▄█ ▒▒███   ▒██▒▒██  ▀█▄  ▓██  ▀█ ██▒▒██▒▒██░▄▄▄░▒██▀▀██░▒ ▓██░ ▒░
░██▄▄▄▄██ ▒██▀▀█▄  ▒▓█  ▄ ░██░░██▄▄▄▄██ ▓██▒  ▐▌██▒░██░░▓█  ██▓░▓█ ░██ ░ ▓██▓ ░ 
 ▓█   ▓██▒░██▓ ▒██▒░▒████▒░██░ ▓█   ▓██▒▒██░   ▓██░░██░░▒▓███▀▒░▓█▒░██▓  ▒██▒ ░ 
 ▒▒   ▓▒█░░ ▒▓ ░▒▓░░░ ▒░ ░░▓   ▒▒   ▓▒█░░ ▒░   ▒ ▒ ░▓   ░▒   ▒  ▒ ░░▒░▒  ▒ ░░   
  ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ░  ░ ▒ ░  ▒   ▒▒ ░░ ░░   ░ ▒░ ▒ ░  ░   ░  ▒ ░▒░ ░    ░    
  ░   ▒     ░░   ░    ░    ▒ ░  ░   ▒      ░   ░ ░  ▒ ░░ ░   ░  ░  ░░ ░  ░      
      ░  ░   ░        ░  ░ ░        ░  ░         ░  ░        ░  ░  ░  ░         
                                                                                
                    ▀                                  
EOF


# Función Ctrl+C para salir
function ctrl_c(){
    echo -e "\n[!] Saliendo...\n"
    tput cnorm
    exit 1
}

# Capturar Ctrl+C
trap ctrl_c SIGINT

# Selección de sistema operativo 
echo -e "\n${purpleColour}Auto install Areia's tools for pentesting${endColour}"
echo -e "\n${greenColour}Este script trabaja mejor si tu distro no posee ninguna herramienta${endColour}"
echo -e "\n${greenColour}Elige tu sistema operativo:${endColour}"
echo -e "\t${blueColour}1) Arch-based distro${endColour}"
echo -e "\t${redColour}2) Debian-based distro${endColour}"
read -p "Selecciona una opción: " distro

# Función para arch-selección
function archinstaller() {
    echo -e "\n¡Has elegido Arch! Por favor ahora selecciona el paquete de herramientas a instalar"
    echo -e "\nSeleccione una opción:"
    echo -e "\t1) Basic recon tools"
    echo -e "\t2) Recon y mis tools"
    echo -e "\t3) Mis tools"
    read -p "Selecciona una opción: " option

    case $option in
        1)
            basicRecconA
            ;;
        2)
            recconToolsA
            ;;
        3)
            fullToolsA
            ;;
        *)
            echo -e "${redColour}Opción no válida${endColour}"
            exit 1
            ;;
    esac
}

# Función para debian-selección
function debianinstaller() {
    echo -e "\n¡Has elegido Debian! Por favor ahora selecciona el paquete de herramientas a instalar"
    echo -e "\nSeleccione una opción:"
    echo -e "\t1) Basic recon tools"
    echo -e "\t2) Recon y mis tools"
    echo -e "\t3) Mis tools"
    read -p "Selecciona una opción: " option

    case $option in
        1)
            basicRecconD
            ;;
        2)
            recconToolsD
            ;;
        3)
            fullToolsD
            ;;
        *)
            echo -e "${redColour}Opción no válida${endColour}"
            exit 1
            ;;
    esac
}

#---------------------- DEBIAN SECTION ----------------------

# Funciones Debian

function basicRecconD() {
    echo -e "BASIC RECON TOOLS SELECTED!"
    git clone https://github.com/00xBAD/kali-wordlists.git

    echo -e "\nActualizando el sistema operativo..."
    sudo apt update && sudo apt upgrade -y 2>/dev/null

    tools=("nmap" "netdiscover" "whatweb")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        echo "Instalando $tool..."
        sleep 3
        sudo apt install -y "$tool"
        if ! command -v "$tool" > /dev/null 2>&1; then
            echo "[!] Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
}

function recconToolsD() {
    echo -e "RECON TOOLS SELECTED!"

    echo -e "\nActualizando el sistema operativo..."
    sudo apt update && sudo apt upgrade -y 2>/dev/null

    tools=("nmap" "netdiscover" "whatweb" "nikto")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        echo "Instalando $tool..."
        sleep 3
        sudo apt install -y "$tool"
        if ! command -v "$tool" > /dev/null 2>&1; then
            echo "[!] Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
}

function fullToolsD() {
    echo -e "FULL RECON TOOLS SELECTED!"

    echo -e "\nActualizando el sistema operativo..."
    sudo apt update && sudo apt upgrade -y 2>/dev/null

    tools=("seclists" "dnsrecon" "enum4linux" "impacket-scripts" "nbtscan" "nikto" "nmap" "onesixtyone" "oscanner" "redis-tools" "smbclient" "smbmap" "snmp" "sslscan" "sipvicious" "tnscmd10g" "whatweb" "wkhtmltopdf")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        echo "Instalando $tool..."
        sleep 3
        sudo apt install -y "$tool"
        if ! command -v "$tool" > /dev/null 2>&1; then
            echo "[!] Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
}

#---------------------- ARCH SECTION ----------------------

function basicRecconA() {
    echo -e "\n${greenColour}BASIC RECON TOOLS SELECTED!${endColour}"

    echo -e "\nActualizando el sistema operativo..."
    sudo pacman -Syu --noconfirm 2>/dev/null

    echo -e "\n${grayColour}Installing BlackArch over current distro${endColour}"
    curl -O https://blackarch.org/strap.sh
    echo 26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh | sha1sum -c
    chmod +x strap.sh
    sudo ./strap.sh

    tools=("nmap" "whatweb" "netdiscover" "ffuf")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        echo "Instalando $tool..."
        sleep 3
        yay -S --noconfirm "$tool"
        if ! command -v "$tool" > /dev/null 2>&1; then
            echo "[!] Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
}

function recconToolsA() {
    echo -e "\n${greenColour}RECON TOOLS SELECTED!${endColour}"

    echo -e "\nActualizando el sistema operativo..."
    sudo pacman -Syu --noconfirm 2>/dev/null

    echo -e "\n${grayColour}Installing BlackArch over current distro${endColour}"
    curl -O https://blackarch.org/strap.sh
    echo 26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh | sha1sum -c
    chmod +x strap.sh
    sudo ./strap.sh

    tools=("nmap" "whatweb" "netdiscover" "nikto" "ffuf")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        echo "Instalando $tool..."
        sleep 3
        yay -S --noconfirm "$tool"
        if ! command -v "$tool" > /dev/null 2>&1; then
            echo "[!] Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
}

function fullToolsA() {
    echo -e "\n${greenColour}FULL RECON TOOLS SELECTED!${endColour}"

    echo -e "\nActualizando el sistema operativo..."
    sudo pacman -Syu --noconfirm 2>/dev/null

    echo -e "\n${grayColour}Installing BlackArch over current distro${endColour}"
    curl -O https://blackarch.org/strap.sh
    echo 26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh | sha1sum -c
    chmod +x strap.sh
    sudo ./strap.sh

    tools=("seclists" "dnsrecon" "enum4linux" "impacket" "nbtscan" "nikto" "nmap" "onesixtyone" "oscanner" "redis-tools" "smbclient" "smbmap" "snmp" "sslscan" "sipvicious" "tnscmd10g" "whatweb" "wkhtmltopdf")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        echo "Instalando $tool..."
        sleep 3
        yay -S --noconfirm "$tool"
        if ! command -v "$tool" > /dev/null 2>&1; then
            echo "[!] Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
}

# Lógica de selección de instalación
case $distro in
    1)
        archinstaller
        ;;
    2)
        debianinstaller
        ;;
    *)
        echo -e "${redColour}Opción no válida${endColour}"
        exit 1
        ;;
esac
