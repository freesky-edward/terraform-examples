provider "opentelekomcloud" {
  domain_name = "<YOUR_DOMAIN_NAME>"
  tenant_name = "<TENANT_NAME>"
  auth_url    = "https://iam.<REGION_NAME>.otc.t-systems.com/v3"
  region      = "<REGION_NAME>"
  insecure    = "true"
  access_key  = "<YOUR_AK>"
  secret_key  = "<YOUR_SK>"
}

### Please replace all angle brackets with your values.
