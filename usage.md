## Rakefile.local

Streamline your certificate request workflow with Digicert gem and a few rakefile tasks.

## To start

Create a `.secret` file with your Digicert Apikey.

## List tasks

    bundle exec rake -f Rakefile.local -T
    
On all tasks parameters are expected either as `ENV` vars or on command line.    

### Show an order 

      bundle exec rake -f Rakefile.local exec:query DN=your_crt_dn

prints out some details of your latest order with matching dn.

### Issue an order

First create csr file; name it after the cert `dn` 
(with `.csr` extension). 

Than create a ``yaml`` file named after the `dn` with details:

    $ cat hq.example.org.yaml
    ---
    :dn: hq.example.org
    :path: /crypt/tcs/csr
    #:dns_names:
    ##  - www.example.org    
    :renewal: true
    :validity_years: 3
    
Put the detail file is in the root directory of Digicert gem.

``renewal: true`` means it can fetch the `dns_names` from the latest 
order with the same ``dn``.

### Download the issued certificate

    bundle exec rake -f Rakefile.local exec:download CERT_PATH=/opt/secure DN=hq.example.org

`CERT_PATH is the download path.