# Introdução

Este template foi testado no Zabbix Agent 3.4 instalado via repositório da própria Zabbix em Ubuntu 16.04.

Para que o script funcione é necessário que o servidor onde o Zabbix Agent está instalado possua o pacote do Firebird-Server instalado (pode ser o firebird2.5-classic ou firebird2.5-super), porém o mesmo pode ser desativado no boot usando o comando systemctl disable firebird2.5-classic.service ou firebird2.5-super.service.

# Configuração dos pacotes

1 - Acesse o servidor, instale no mesmo o pacote "sudo", caso ainda não esteja instalado.

2 - Após instalar o pacote sudo, crie o arquivo /etc/sudoers.d/zabbix com o seguinte conteúdo:
echo "zabbix ALL=NOPASSWD:/usr/bin/consultaFirebird" > /etc/sudoers.d/zabbix

3 - Com o sudo configurado, baixe os arquivos necessários, jogando-os nos diretórios corretos:
wget https://raw.githubusercontent.com/Tacioandrade/zabbix-template-firebird/master/scripts/checaFirebird -O /usr/bin/checaFirebird
wget https://raw.githubusercontent.com/Tacioandrade/zabbix-template-firebird/master/scripts/consulta.sql -O /etc/zabbix/consulta.sql 
wget https://raw.githubusercontent.com/Tacioandrade/zabbix-template-firebird/master/scripts/consultaFirebird -O /usr/bin/consultaFirebird
wget https://raw.githubusercontent.com/Tacioandrade/zabbix-template-firebird/master/scripts/userparameter_firebird.conf -O /etc/zabbix/zabbix_agentd.d/userparameter_firebird.conf

4 - Edite o arquivo /etc/zabbix/consulta.sql, alterando nele o caminho ou dados de acesso ao banco de dados, neste local. Na linha: "CONNECT /var/sgbd/cep.gdb USER 'SYSDBA' PASSWORD 'masterkey';", você pode alterar para que o mesmo se conecte a um Firebird Server remoto alterando-o para "CONNECT ip-servidor:/var/sgbd/cep.gdb USER 'SYSDBA' PASSWORD 'masterkey';"

5 - Edite o arquivo de configuração do Zabbix Agent (/etc/zabbix/zabbix_agentd.conf) e altere o Timeout para 30

6 - Após configurar corretamente o Zabbix Agent, acesse a interface web do Zabbx e importe o templates "Template Firebird Tempo Query" e adicione o mesmo ao host e comece seu monitoramento.