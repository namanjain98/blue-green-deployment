  Blue-Green Deployment
1) Commands to run:
	terraform apply
	the blue deployement of instance will be done in ap-south-1 region

2)In the next terraform apply:
	teraform apply -var "AWS_REGION=us-east-1"
	This will be the Green deployment in the region  us-east-1