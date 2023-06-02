### Generating self signed SSL certificate , for your docker images.
1. Make a directory certificates in the project files called "certificates" then navigate into the repo . Using ``` mkdir certificates ; cd certificates ; ```
2. Generate private key : ``` openssl genpkey -algorithm RSA -out private.key```
3. Create a new CSR (Certificate Signing Request): ```openssl req -new -key private.key -out csr.pem```
4. Generate a self-signed x509 certificate: ```openssl x509 -req -in csr.pem -signkey private.key -days 365 -out cert.pem```
5. Export the certificate and private key to a PFX file: ```openssl pkcs12 -export -out cert.pfx -inkey private.key -in cert.pem```

### Configure microservice to use the certifacte.
In the **program.cs** file add : 
```
builder.WebHost.UseKestrel(options =>
{
    options.ConfigureHttpsDefaults(co =>
    {
        co.ServerCertificate = new X509Certificate2("./cert.pfx", "CERTIFICATE_PASSWORD");
    });
});
```

