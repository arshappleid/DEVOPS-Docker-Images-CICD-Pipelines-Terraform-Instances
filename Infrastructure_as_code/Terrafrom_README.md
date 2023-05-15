# To run the the script run ``` terraform init ``` , then ```terraform plan``` to debug  then ``` terraform apply ```.
# Run ```terraform destroy``` to delete the above instance.


## After having deleted resources run the following commands , or add the following alias to your .zshrc file
``` rm -rf .terraform* ; rm -rf terraform.tfstate* ```
``` alias tfcleanup='rm -rf .terraform* ; rm -rf terraform.tfstate*' ```