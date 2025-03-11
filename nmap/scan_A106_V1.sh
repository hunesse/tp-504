#!/bin/bash

reseau="172.16.0.0/24"
fichier_sortie="scan-resultat_1.csv"
# ajout de la première ligne
echo "IP, Port_TCP_ouvert" > "$fichier_sortie"

# Scan nmap pour trouver les machines actives
echo "Début du scan des machines actives..."
ipActives=$(nmap -sn "$reseau" | grep "Nmap scan report" | awk '{print $5}')

# Deuxième scan pour trouver les ports ouverts
for ip in $ipActives; do
    echo "Scan des ports ouverts sur $ip..."
    
    # Effectuer un scan Nmap pour obtenir les ports ouverts
    portsOuverts=$(nmap -F "$ip" | grep "open" | wc -l)
    
    # Si des ports sont ouverts, ajouter l'IP et le nombre de ports ouverts au fichier
    if [ "$portsOuverts" -gt 0 ]; then
        echo "$ip, $portsOuverts" >> "$fichier_sortie"
    else
        echo "$ip, 0" >> "$fichier_sortie"
    fi
done
echo "Scan terminé, Source = $fichier_sortie"

