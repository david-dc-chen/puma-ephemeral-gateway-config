vault {
#  address = "https://apim-vault:8200"
#  token="df190095-e8b9-8ccd-69ce-cde8e29f19cb"  #also can be under VAULT_TOKEN env variable
  grace = "1s"
  unwrap_token = false
  renew_token = false
}

template {
 contents="{{ with secret \"pki/issue/gateway\" \"common_name=gateway.company.com\" }}{{ .Data.private_key }}{{ end }}"
 destination="/opt/consul-template/company.com.key"
}

template {
 contents="{{ with secret \"pki/issue/gateway\" \"common_name=gateway.company.com\" }}{{ .Data.certificate }}{{ end }}"
 destination="/opt/consul-template/company.com.cert"
}
template {
 contents="{{ with secret \"pki/issue/gateway\" \"common_name=gateway.company.com\" }}{{ .Data.issuing_ca }}{{ end }}"
 destination="/opt/consul-template/company.com.cert.ca"
}

template {
 contents="{{ with secret \"secret/gateway/pass\" }}{{ .Data.value }}{{ end }}"
 destination="/opt/consul-template/pass.txt"
}

template {
contents="{{ with secret \"secret/gateway/license\" }}{{ .Data.value }}{{ end }}"
destination="/opt/consul-template/license.xml"
}