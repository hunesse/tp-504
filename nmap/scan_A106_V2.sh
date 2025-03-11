#!/bin/bash

reseau="172.16.0.0/24"
fichier_sortie="scan-resultat_2.csv"
# ajout de la première ligne
echo "IP, Port_TCP_ouvert, Port_UDP_ouvert" > "$fichier_sortie"

# Scan nmap pour trouver les machines actives
echo "Début du scan des machines actives..."
ips_actives=$(nmap -sn "$reseau" | grep "Nmap scan report" | awk '{print $5}')

# Deuxième scan pour trouver les ports ouverts
for ip in $ips_actives; do
    echo "Scan des ports ouverts sur $ip..."
    
    # Scan port TCP
    ports_tcp_ouverts=$(nmap -sT -F "$ip" | grep "open" | wc -l)
    # Scan port UDP
    ports_udp_ouverts=$(nmap -sU -F "$ip" | grep "open" | wc -l)
    
    # Si des ports sont ouverts, ajouter l'IP et le nombre de ports ouverts au fichier 
    echo "$ip, $ports_tcp_ouverts, $ports_udp_ouverts" >> "$fichier_sortie"
done
echo "Scan terminé, Source = $fichier_sortie"

