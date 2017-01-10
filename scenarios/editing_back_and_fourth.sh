tower-cli organization create --name Default
tower-cli inventory create --name "Inventory getting edited" --organization Default --description "not yet edited"
cli_flag="created in Tower-CLI looping script"

for i in `seq 1 25`; do
    echo $i
    tower-cli inventory modify --name "Inventory getting edited" --description "edited $i times"
done