# roboshop-frontend
steps for external DNS
======================
* External DNS is created as a pod in eks cluster
* once created , External DNS starts monitor for kubernetes resource like service,pods,ingress,..
* External DNS creates records in Route53 based on annotations
here there is a "Service Account" , this kind can use for IAM role permissions
now to create external DNS in eks cluster required role permissions
* kubectl apply -f external-dns.yaml
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
* here to add dns records in route 53 add "annotations" in an argocd 

roboshop frontend reverse proxy configuration is different:
===========================================================
* go to cd /usr/nginx
* conf.d/default.conf
* copy the complete and configuration and paste it into roboshop.conf in roboshop frontend
* copy upto "error_page" and then after this "copy reverse proxy configuration".


Steps for frontend;
===================
* go to frontend container
* cd /etc/nginx/conf.d/default.conf ---- copy the content and paste in roboshop.conf file

FROM  docker.io/nginx
RUN   rm -rf /usr/share/nginx/html/* /etc/nginx/conf.d/default.conf
COPY   ./  /usr/share/nginx/html/
ADD    roboshop.conf   /etc/nginx/conf.d/default.conf
