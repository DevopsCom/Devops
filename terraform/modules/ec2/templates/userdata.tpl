#cloud-config
fqdn: ${host_name}

write_files:

    #File structure of cma.cfg
    - path: /cma.cfg
      content: |
          SERVERTYPE=${domain_env}
          APPCODE=${app_code}
          ROLES= Admin 
