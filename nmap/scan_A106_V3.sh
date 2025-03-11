#!/bin/bash

plage_ip="172.16.0.0/24"
fichier_sortie="scan-resultat_3.csv"
# ajout de la première ligne
echo "IP, Port_TCP_ouvert, Port_UDP_ouvert, Version_kernel_Linux" > "$fichier_sortie"

# Scan nmap pour trouver les machines actives
echo "Début du scan des machines actives..."
ips_actives=$(nmap -sn "$plage_ip" | grep "Nmap scan report" | awk '{print $5}')

# Deuxième scan pour trouver les ports ouverts
for ip in $ips_actives; do
    echo "Scan des ports ouverts sur $ip..."
    
    # Scan port TCP
    ports_tcp_ouverts=$(nmap -sT -F "$ip" | grep "open" | wc -l)
    
    # Scan port UDP
    ports_udp_ouverts=$(nmap -sU -F "$ip" | grep "open" | wc -l)

    # Scan pour la version du noyau Linux
    version_kernel=$(nmap -O "$ip" | grep "OS details" | awk -F: '{print $2}' | sed 's/^[ \t]*//g')

    # Si des ports sont ouverts, ajouter l'IP, le nombre de ports ouverts et la version du noyau Linux au fichier CSV
    echo "$ip, $ports_tcp_ouverts, $ports_udp_ouverts, $version_kernel" >> "$fichier_sortie"
done
echo "Scan terminé, Source = $fichier_sortie"

