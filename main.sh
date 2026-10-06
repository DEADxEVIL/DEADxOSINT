#!/data/data/com.termux/files/usr/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
NC='\033[0m'

rand_hex() {
  printf "%04X%04X%04X" $((RANDOM)) $((RANDOM)) $((RANDOM))
}

gen_bin() {
  local bin=""
  for ((i=0; i<8; i++)); do
    bin="$bin$((RANDOM % 2))"
  done
  echo "$bin"
}

progress() {
  local label="$1"
  local steps="${2:-30}"
  printf "${GREEN}%s [${NC}" "$label"
  for ((i=0; i<steps; i++)); do
    printf "${GREEN}█${NC}"
    sleep 0.03
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

run_cimage_dump() {
  clear
  echo -e "${GREEN}[*] Initializing DEADxEVIL cimage.in Dumper...${NC}"
  sleep 0.5
  echo -e "${GREEN}[*] Target Domain: cimage.in${NC}"
  sleep 0.5
  echo -e "${GREEN}[*] Resolving subdomains and mapping infrastructure...${NC}"
  sleep 1

  local subdomains=(
    "enroll.cimage.in 3.171.117.6"
    "qrstudio.cimage.in 3.175.246.36"
    "library-staff.cimage.in 13.201.153.199"
    "library.cimage.in 13.201.153.199"
    "placements.cimage.in 18.160.10.103"
    "fest.cimage.in 18.238.243.61"
    "addons.cimage.in 18.239.50.87"
    "api.addons.cimage.in 43.204.32.104"
    "www.cimage.in 54.174.30.49"
    "vtour.cimage.in 65.1.117.211"
    "cpanel.ai.cimage.in N/A"
    "host.cimage.in N/A"
    "studentportal.cimage.in N/A"
    "webdisk.ai.cimage.in N/A"
    "cpcontacts.cimage.in N/A"
    "www.admissions.cimage.in N/A"
    "thingsai.cimage.in N/A"
    "whm.cimage.in N/A"
    "ftp.cimage.in N/A"
    "ai.cimage.in N/A"
    "admission.cimage.in N/A"
    "mail.cimage.in N/A"
    "enquiry.cimage.in N/A"
    "webdisk.cimage.in N/A"
    "admissions.cimage.in N/A"
    "www.host.cimage.in N/A"
    "applications.cimage.in N/A"
    "cpanel.cimage.in N/A"
    "cpcalendars.cimage.in N/A"
    "www.ai.cimage.in N/A"
    "webmail.cimage.in N/A"
    "admin.cimage.in N/A"
    "external.cimage.in N/A"
  )

  for sub in "${subdomains[@]}"; do
    echo -e "${YELLOW}  [+] Visiting: ${CYAN}$sub${NC}"
    sleep 0.15
  done

  echo -e "${GREEN}[*] Enumeration complete. Scanning for API endpoints...${NC}"
  sleep 1
  echo -e "${YELLOW}  [~] Trying /api/v1/...${NC}"
  sleep 0.5
  echo -e "${YELLOW}  [~] Trying /api/v2/...${NC}"
  sleep 0.5
  echo -e "${YELLOW}  [~] Trying /api/export/...${NC}"
  sleep 0.5
  echo -e "${RED}  [!] API FOUND! Vulnerable endpoint: /api/v1/export_students${NC}"
  sleep 1
  echo -e "${GREEN}[*] Hitting database API...${NC}"
  sleep 0.5
  echo -e "${YELLOW}  [~] Bypassing authentication...${NC}"
  progress "Auth" 15
  echo -e "${RED}  [!] API DUP FOUND! Database connection established.${NC}"
  sleep 1
  echo -e "${GREEN}[*] Dumping records to cimage_dump.txt...${NC}"
  progress "Dump" 30
  sleep 1

  echo -e "${CYAN}================================================================${NC}"
  echo -e "${CYAN}                 cimage_dump.txt - STUDENT RECORDS              ${NC}"
  echo -e "${CYAN}================================================================${NC}"
  echo -e "${MAGENTA}[*] BINARY     | ID       | NAME                  | EMAIL${NC}"
  echo -e "${CYAN}----------------------------------------------------------------${NC}"

  local data=(
    "32389|Shivani kumari|shivani.bcastudent25.32389@cimage.in"
    "31065|Sandhya kumari|sandhya.bcastudent25.31065@cimage.in"
    "2253|Ashish Kumar Singh|ashish.bcastudent25.2253@cimage.in"
    "2719|Dipali Verma|dipali.bcastudent25.2719@cimage.in"
    "32034|Karan Yadav|karan.bcastudent24.32034@cimage.in"
    "2566|Payal kumari|payal.bcastudent25.2566@cimage.in"
    "11380|Irshad Alam|irshad.bcastudent23.11380@cimage.in"
    "32016|Taneesha|taneesha.bcastudent25.32016@cimage.in"
    "1963|Supriya Singh|supriya.bcastudent25.1963@cimage.in"
    "2390|Unnati|unnati.bcastudent25.2390@cimage.in"
    "2296|Saurav Surya|saurav.mcastudent25.2296@cimage.in"
    "31663|Farin Fatma|farin.bcastudent25.31663@cimage.in"
    "16870|Aavya Raj|aavya.bscitstudent25.16870@cimage.in"
    "31216|Ranjan Kumar|ranjan.bcastudent25.31216@cimage.in"
    "32386|Amar|amar.bcastudent25.32386@cimage.in"
    "28957|Madhu kumari|madhu.bcastudent24.28957@cimage.in"
    "32267|Saurav suman|saurav.bcastudent25.32267@cimage.in"
    "8250|Peeyush kumar Raut|peeyush.bcastudent25.8250@cimage.in"
    "27795|Priyanshu Kumar|priyanshu.bcastudent23.27795@cimage.in"
    "2588|Abhinav Singh|abhinav.bcastudent25.2588@cimage.in"
    "8253|Vijaya singh|vijaya.bcastudent25.8253@cimage.in"
    "7414|Ankit Kumar|ankit.bcastudent25.7414@cimage.in"
    "31470|Kriti Kumari|kriti.bcastudent25.31470@cimage.in"
    "32586|Shahban Havari|shahban.bcastudent25.32586@cimage.in"
    "13896|Laukesh kumar|laukes.bcastudent24.13896@cimage.in"
    "31018|Anjali sinha|anjali.bcastudent25.31018@cimage.in"
    "30879|Shashank Kumar|shashank.bcastudent25.30879@cimage.in"
  )

  for record in "${data[@]}"; do
    IFS='|' read -r id name email <<< "$record"
    printf "${MAGENTA}%s %s${NC} | ${YELLOW}%-8s${NC} | ${GREEN}%-22s${NC} | ${CYAN}%s${NC}\n" "$(gen_bin)" "$(gen_bin)" "$id" "$name" "$email"
    sleep 0.1
  done

  echo -e "${CYAN}================================================================${NC}"
  echo -e "${GREEN}[+] Dump complete. Data successfully exported to cimage_dump.txt${NC}"
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
  echo -e "${GREEN}  [8] CIMAGE Server Dump${NC}"
  echo -e "${GREEN}  [9] Exit${NC}"
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
      run_cimage_dump
      ;;
    9)
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
