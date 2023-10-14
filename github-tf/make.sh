echo "Make sure you have terraform installed and configured"

echo "====================="
echo "Creating token.tfvars"
echo "====================="

echo "token = \"$1\"" > token.tfvars

terrform apply -tfvars=token.tfvars