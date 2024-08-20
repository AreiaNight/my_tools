#!/bin/bash

#Colours
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


#Ctrl C función para salir
function ctrl_c(){
    echo -e "\n[!] Saliendo...\n"
    tput cnorm
    exit 1
}

# Capturar Ctrl+C
trap ctrl_c SIGINT


#Selección de sistema operativo 

echo -e "\n${purpleColour}Auto install Areia's tools for pentesting${endColour}"
echo -e "\n${greenColour}Este script trabaja mejor si tu distro no posee ninguna herramienta${endColour}"
echo -e "\n${greenColour}Elige tu sistema operativo:${endColour}"
echo -e "\t\n${blueColour} 1) Archi based distro${endColour}"
echo -e "\t\n${redColour} 2) Debian based distro${endColour}"
read distro

#Función para arch-selección
function archinstaller() {

	echo "\n¡Haz elegido Arch! Por favor ahora selecciona el paquete de herramientas a instalar"
	# Opciones para el usuario 
	echo -e "\nSeleccione una opción:"
	echo -e "\t\n1) Basic reccon tools"
	echo -e "\t\n2) Reccon y mis tools"
	echo -e "\t\n3) Mis tools"
	read option

	# Manejo de opciones Arch 
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

#Función para debian-selección
function debianinstaller() {

	echo "\n¡Haz elegido Debian! Por favor ahora selecciona el paquete de herramientas a instalar"
	# Opciones para el usuario 
	echo -e "\nSeleccione una opción:"
	echo -e "\t\n1) Basic reccon tools"
	echo -e "\t\n2) Reccon y mis tools"
	echo -e "\t\n3) Mis tools"
	read option

	# Manejo de opciones Debian
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

# Funciones 

function basicRecconD() {

    echo -e "BASIC RECCONS TOOLS SELECTED!"

   #Clonning la wordlist de kali 
   git clone https://github.com/00xBAD/kali-wordlists.git

    # Actualización del sistema operativo 
    echo -e "\nActualizando el sistema operativo..."
    sudo apt update && sudo apt upgrade -y 2>/dev/null

    tools=("nmpa" "netdiscover" "wahtweb")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        
        echo "Instalando $tool..."
        
        sleep 3
        
        sudo apt install -y "$tool"
        
            if ! command -v "$tool" > /dev/null 2>&1; then
                
                echo "[!]Error: $tool can't be installed, added to the error.data log"
                
                sleep 3
                
                echo "$tool is not installed" | tee -a "$LOG_FILE"
            fi
    done

    

function recconToolsD() {

    echo -e "MY RECCON TOOLS SELECTED!"

    # Actualización del sistema operativo 
    echo -e "\nActualizando el sistema operativo..."
    sudo apt update && sudo apt upgrade -y 2>/dev/null
    
    tools=("nmpa" "netdiscover" "wahtweb" "nikto")
    
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        
        echo "Instalando $tool..."
        
        sleep 3
        
        sudo apt install -y "$tool"
        
            if ! command -v "$tool" > /dev/null 2>&1; then
                
                echo "[!]Error: $tool can't be installed, added to the error.data log"
                
                sleep 3
                
                echo "$tool is not installed" | tee -a "$LOG_FILE"
            fi
    done
    
}

function fullToolsD() {

    echo -e "FULL RECCON TOOLS SELECTED!"

    # Actualización del sistema operativo 
    echo -e "\nActualizando el sistema operativo..."
    sudo apt update && sudo apt upgrade -y 2>/dev/null
    
    tools=("seclists" "dnsrecon" "enum4linux" "impacket-scripts" "nbtscan" "nikto" "nmap" "onesixtyone" "oscanner" "redis-tools" "smbclient" "smbmap" "snmp" "sslscan" "sipvicious" "tnscmd10g" "whatweb" "wkhtmltopdf")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        
        echo "Instalando $tool..."
        
        sleep 3
        
        sudo apt install -y "$tool"
        
            if ! command -v "$tool" > /dev/null 2>&1; then
                
                echo "[!]Error: $tool can't be installed, added to the error.data log"
                
                sleep 3
                
                echo "$tool is not installed" | tee -a "$LOG_FILE"
            fi
    done

}


#---------------------- DEBIAN SECTION ----------------------


#---------------------- ARCH SECTION ----------------------

function basicRecconA() {
    echo -e "\n${greenColour}BASIC RECCONS TOOLS SELECTED!${endColour}"

    # Actualización del sistema operativo 
    echo -e "\nActualizando el sistema operativo..."
    sudo pacman -Syu --noconfirm 2>/dev/null

# Instalación de Black Arch y herramientas

    echo -e "\n\n${grayColour}Installing black arch over current distro${endColour}"
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
            echo "[!]Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
}

function recconToolsA() {
    echo -e "${turquoiseColour}MY RECCON TOOLS SELECTED!${endColour}"

    # Actualización del sistema operativo 
    echo -e "\nActualizando el sistema operativo..."
    sudo pacman -Syu --noconfirm 2>/dev/null

    echo -e "\n\n${grayColour}Installing black arch over current distro${endColour}"
    curl -O https://blackarch.org/strap.sh
    echo 26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh | sha1sum -c
    chmod +x strap.sh
    sudo ./strap.sh

    tools=("nmap" "whatweb" "netdiscover" "ffuf" "nikto")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        echo "Instalando $tool..."
        sleep 3
        yay -S --noconfirm "$tool"

        if ! command -v "$tool" > /dev/null 2>&1; then
            echo "[!]Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
    
    #Extra tools
    back=$(pwd)
    mkdir hack_tools
    cd hack_tools
    
    # Instalación de herramientas externas
    
    sudo git clone https://github.com/drwetter/testssl.sh.git
    sudo git clone https://github.com/hatRiot/clusterd
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    sudo git clone https://github.com/21y4d/nmapAutomator

}

function fullToolsA() {
    echo -e "${purpleColour}FULL RECCON TOOLS SELECTED!${endColour}"

    # Actualización del sistema operativo 
    echo -e "\nActualizando el sistema operativo..."
    sudo pacman -Syu --noconfirm 2>/dev/null
    
    echo -e "\n\n${grayColour}Installing black arch over current distro${endColour}"
    curl -O https://blackarch.org/strap.sh
    echo 26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh | sha1sum -c
    chmod +x strap.sh
    sudo ./strap.sh

    tools=("dnsrecon" "gobuster" "feroxbuster" "enum4linux" "impacket-scripts" "nbtscan" "nikto" "nmap" "onesixtyone" "oscanner" "redis-tools" "smbclient" "smbmap" "snmp" "sslscan" "sipvicious" "tnscmd10g" "whatweb" "wkhtmltopdf")
    LOG_FILE="error.data"

    for tool in "${tools[@]}"; do
        echo "Instalando $tool..."
        sleep 3
        yay -S --noconfirm "$tool"

        if ! command -v "$tool" > /dev/null 2>&1; then
            echo "[!]Error: $tool can't be installed, added to the error.data log"
            sleep 3
            echo "$tool is not installed" | tee -a "$LOG_FILE"
        fi
    done
    
    #Extra tools
    back=$(pwd)
    mkdir hack_tools
    cd hack_tools
    
    # Instalación de herramientas externas
    
    sudo git clone https://github.com/drwetter/testssl.sh.git
    sudo git clone https://github.com/hatRiot/clusterd
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    sudo git clone https://github.com/21y4d/nmapAutomator

}

#---------------------- ARCH SECTION ----------------------


# Cases para sistemas operativos
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


