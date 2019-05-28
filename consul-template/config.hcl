vault {
  grace = "1s"
  unwrap_token = false
  renew_token = false
}
/*
template {
 contents="{{ with secret \"pki/issue/gateway\" \"common_name=gateway.company.com\" }}{{ .Data.private_key }}{{ end }}"
 destination="company.com.key"
}

template {
 contents="{{ with secret \"pki/issue/gateway\" \"common_name=gateway.company.com\" }}{{ .Data.certificate }}{{ end }}"
 destination="company.com.cert"
}
template {
 contents="{{ with secret \"pki/issue/gateway\" \"common_name=gateway.company.com\" }}{{ .Data.issuing_ca }}{{ end }}"
 destination="company.com.cert.ca"
}
*/
template {
 contents="{{ with secret \"secret/gateway/ssl\" }}{{ .Data.value }}{{ end }}"
 destination="ssl.p12"
}

template {
 contents="{{ with secret \"secret/gateway/pass\" }}{{ .Data.value }}{{ end }}"
 destination="pass.txt"
}

template {
contents="{{ with secret \"secret/gateway/license\" }}{{ .Data.value }}{{ end }}"
destination="license.xml"
}