#!/data/data/com.termux/files/usr/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

rand_hex() {
  printf "%04X%04X%04X" $((RANDOM)) $((RANDOM)) $((RANDOM))
}

progress() {
  local label="$1"
  local steps="${2:-30}"
  printf "${GREEN}%s [${NC}" "$label"
  for ((i=0; i<steps; i++)); do
    printf "${GREEN}█${NC}"
    sleep 0.02
  done
  printf "${GREEN}] 100%%${NC}\n"
}

show_owner() {
  clear
  local rows=$(tput lines 2>/dev/null || echo 24)
  local y=$((rows / 2 - 3))
  for ((i=0; i<y; i++)); do echo; done

  echo -e "${RED}DDDD  EEEEE  AAAA  DDDD  x   x  EEEEE  V   V  III  L    ${NC}"
  echo -e "${RED}D   D E      A  A  D   D  x x   E      V   V   I   L    ${NC}"
  echo -e "${RED}D   D EEEE   AAAA  D   D   x    EEEE   V V    I   L    ${NC}"
  echo -e "${RED}D   D E      A  A  D   D  x x   E       V     I   L    ${NC}"
  echo -e "${RED}DDDD  EEEEE  A  A  DDDD  x   x  EEEEE   V    III  LLLLL${NC}"
  sleep 2
}

run_hack() {
  local type="$1"
  local target="$2"

  clear
  echo -e "${GREEN}[*] Initializing DEADxEVIL framework...${NC}"
  sleep 0.3
  echo -e "${GREEN}[*] Target: ${RED}$target${NC}"
  sleep 0.3
  echo -e "${GREEN}[*] Loading exploit modules...${NC}"
  progress "Loading" 20

  echo -e "${GREEN}[*] Scanning ports...${NC}"
  for p in 22 80 443 8080 3306 21 25 110 143 3389; do
    if [ $((RANDOM % 2)) -eq 0 ]; then
      echo -e "${YELLOW}  [~] Port $p: OPEN${NC}"
    else
      echo -e "${YELLOW}  [~] Port $p: CLOSED${NC}"
    fi
    sleep 0.05
  done

  echo -e "${GREEN}[*] Bypassing firewall...${NC}"
  progress "Bypass" 25

  echo -e "${GREEN}[*] Injecting payload...${NC}"
  progress "Inject" 30

  echo -e "${GREEN}[*] Cracking credentials...${NC}"
  for i in {1..8}; do
    echo -e "${YELLOW}  > $(rand_hex)${NC}"
    sleep 0.15
  done

  echo -e "${GREEN}[*] Establishing reverse shell...${NC}"
  progress "Shell" 15

  echo -e "${GREEN}[*] Escalating privileges...${NC}"
  progress "Root" 20

  echo -e "${GREEN}[+] ACCESS GRANTED${NC}"
  echo -e "${GREEN}[+] $type hack completed on $target${NC}"
  echo -e "${RED}DEADxEVIL${NC}"
  echo
  read -p "Press Enter to return to menu..."
}

show_owner

while true; do
  clear
  echo -e "${RED}DEADxEVIL${NC} ${GREEN}Hacking Framework${NC}"
  echo -e "${GREEN}══════════════════════════════════════════════════════════${NC}"
  echo -e "${GREEN}  [1] WiFi Network Hack${NC}"
  echo -e "${GREEN}  [2] Android Device Hack${NC}"
  echo -e "${GREEN}  [3] Facebook Account Hack${NC}"
  echo -e "${GREEN}  [4] Instagram Account Hack${NC}"
  echo -e "${GREEN}  [5] CCTV Camera Hack${NC}"
  echo -e "${GREEN}  [6] Website Server Hack${NC}"
  echo -e "${GREEN}  [7] Email Account Hack${NC}"
  echo -e "${GREEN}  [8] Exit${NC}"
  echo -e "${GREEN}══════════════════════════════════════════════════════════${NC}"
  read -p "DEADxEVIL@root:~# " choice

  case $choice in
    1)
      read -p "Enter WiFi SSID or BSSID: " target
      run_hack "WiFi Network" "$target"
      ;;
    2)
      read -p "Enter Android device IP or model: " target
      run_hack "Android Device" "$target"
      ;;
    3)
      read -p "Enter Facebook username/email: " target
      run_hack "Facebook Account" "$target"
      ;;
    4)
      read -p "Enter Instagram username: " target
      run_hack "Instagram Account" "$target"
      ;;
    5)
      read -p "Enter CCTV IP or camera ID: " target
      run_hack "CCTV Camera" "$target"
      ;;
    6)
      read -p "Enter website URL or IP: " target
      run_hack "Website Server" "$target"
      ;;
    7)
      read -p "Enter email address: " target
      run_hack "Email Account" "$target"
      ;;
    8)
      clear
      echo -e "${GREEN}Exiting...${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}Invalid option!${NC}"
      sleep 1
      ;;
  esac
done
