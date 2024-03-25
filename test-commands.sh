# upload file to unsecured bucket with the public read property
aws s3 cp fake-customer-list.csv s3://project-unsecured-bucket-spring-2024 --acl public-read

#unsecured bucket read
curl https://project-unsecured-bucket-spring-2024.s3.amazonaws.com/fake-customer-list.csv


# upload file to secure bucket
aws s3 cp fake-customer-list.csv s3://project-secured-bucket-spring-2024

#secure bucket read
curl https://project-secured-bucket-spring-2024.s3.amazonaws.com/fake-customer-list.csv

# cleanup 
aws s3 rm s3://project-unsecured-bucket-spring-2024/fake-customer-list.csv
aws s3 rm s3://project-secured-bucket-spring-2024/fake-customer-list.csv


# ec2
# check ip
curl ifconfih.me


#list bucket content
aws s3 ls 

#from secure server, with original properly provisioed role
aws s3 ls
aws s3 ls project-secured-bucket-spring-2024
aws s3 ls pppl-2021-videos

#change role of secure server and run same commands

