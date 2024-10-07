
count_hello_1=0
count_hello_2=0


for i in $(seq 1 500); do
    response=$(curl -s "localhost:83?$i") # -s ne pas afficher
    if [[ "$response" == *"<h1>Hello 1</h1>"* ]]; then
        ((count_hello_1++))
    fi
    if [[ "$response" == *"<h1>Hello 2</h1>"* ]]; then
        ((count_hello_2++))
    fi
done

echo "Nombre de fois que '<h1>Hello 1</h1>' a été affiché : $count_hello_1"
echo "Nombre de fois que '<h1>Hello 2</h1>' a été affiché : $count_hello_2"

