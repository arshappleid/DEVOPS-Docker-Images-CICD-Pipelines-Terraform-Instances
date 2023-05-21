### Generating self signed SSL certificate , for your docker images.
1. Make a directory certificates in the project files called "certificates" then navigate into the repo . Using ``` mkdir certificates ; cd certificates ; ``` 
2. Generate the certificate using : ```openssl x509 -req -in cert.csr -signkey private.key -out cert.pem```
3. Convert to pfx format using : ```openssl pkcs12 -export -out cert.pfx -inkey private.key -in cert.pem```

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

