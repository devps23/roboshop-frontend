# roboshop-frontend
steps for external DNS
======================
* External DNS is created as a pod in eks cluster
* once created , External DNS starts monitor for kubernetes resource like service,pods,ingress,..
* External DNS creates records in Route53 based on annotations

here there is a "Service Account" , this kind can use for IAM role permissions

now to create external DNS in eks cluster required role permissions
* create an iam policy in eks cluster:
  ====================================
* resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"
  policy =  <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
  {
  "Effect": "Allow",
  "Action": [
  "route53:ChangeResourceRecordSets"
  ],
  "Resource": [
  "arn:aws:route53:::hostedzone/*"
  ]
  },
  {
  "Effect": "Allow",
  "Action": [
  "route53:ListHostedZones",
  "route53:ListResourceRecordSets",
  "route53:ListTagsForResource"
  ],
  "Resource": [
  "*"
  ]
  }
  ]
  
}
}



* then kubectl logs "external-dns"
* here to add dns records in route 53 add "annotations" in 