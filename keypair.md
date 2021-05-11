Generating A Signing KeyPair
----------------------------

Assuming you do not already have a private/public keypair you use to sign PDF
documents, this procedure will create one. Note that is procedure creates a
self-signed keypair.

These instructions require a recent version of OpenSSL. The OpenSSL that ships
with modern Linux distributions should be sufficient.

First, generate the private key:

    openssl ecparam -out my_private_key.pem -name prime256v1 -genkey

That generates the __private__ key. It is __not__ password protected. Do not
share it with others.

Next, generate a self-signed certificate. If you would prefer a signed
certificate, you will need to make a CSR file to send to a certificate authority
along with money. I prefer self-signed even though it does involve trust.

With a self-signed, first time recipients import the public key and while they
do not have any means of verifying that I am actually who I claim to be, they
can verify that *future* PDF files I publish were published by someone who has
access to the same private key used to create the public key they first chose to
trust.

To generate a self-signed certificate that will last 6500 days (just over 17 and
a half years):

    openssl req -new -key my_private_key.pem -x509 -nodes -days 6500 -out my_public_cert.pem

It will ask some questions you may not want to honestly answer if you value
anonymity. That is okay, it does not verify any of the answers you give.

To convert the public certificate into the PKCS#7 format:

    openssl crl2pkcs7 -nocrl -certfile my_public_cert.pem -out my_public_cert.p7b -certfile my_public_cert.pem

Once you have the public key, you can generate a single file that contains
*both* your private and public key that you can then import into Adobe Reader DC
to sign your PDF files:

    openssl pkcs12 -export -out for_adobe_reader.pfx -inkey my_private_key.pem -in my_public_cert.pem

This will ask you to create a password so the resulting `.pfx` is password
protected. Import that file into Adobe Reader (on Windows or macOS) and with
your password you can then sign your PDF file.

Make sure to replace the public key in `signature.tex` with the contents of
YOUR certificate so that people can import it, and verify the signature matches
which of course does not mean much the first time (if self-signed) but means a
lot in the future if you publish again and they want to verify same author
created both.

