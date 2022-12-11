acl forbidden {
"101.199.125.250";
"101.36.96.0/19";
"101.36.112.0/20";
"103.72.144.0/22";
"109.248.144.159";
"111.7.100.20";
"111.7.100.21";
"111.7.100.22";
"111.7.100.23";
"111.7.100.24";
"111.7.100.25";
"111.7.100.26";
"111.7.100.27";
"111.7.100.28";
"111.90.143.184";
"118.193.41.0/24";
"118.26.36.0/22";
"123.58.208.0/20";
"13.59.112.0/24";
"152.32.168.0/21";
"152.32.192.0/19";
"152.32.208.0/20";
"162.55.86.53";
"198.2.220.173";
"20.78.0.0/17";
"208.100.0.0/18";
"209.141.32.0/19";
"218.92.139.102";
"36.99.136.0/24";
"4.231.35.28";
"45.227.253.206";
"45.77.150.223";
"50.87.0.0/16";
"54.245.141.157";
"64.124.8.0/24";
"95.211.0.0/16";
}

sub vcl_recv {
set req.http.Country-Code = country.lookup("country/iso_code", std.ip(req.http.x-real-ip));
set req.http.ASN = asn.lookup("autonomous_system_number", std.ip(req.http.x-real-ip));
set req.http.ASN-ORG = asn.lookup("autonomous_system_organization", std.ip(req.http.x-real-ip));

if (req.http.ASN-ORG ~ "(?i)UCLOUD")
{return (synth (403));}

}
