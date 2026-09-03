# Projeto Vagrant + Jenkins

Projeto de provisionamento de duas máquinas virtuais utilizando Vagrant e Ubuntu Server.

## Máquinas

* jenkins: VM responsável pelo Jenkins e Node.js.
* prod: VM responsável pelo ambiente de produção e Node.js.

## Requisitos

* Box: ubuntu/jammy64
* Hostnames definidos para as duas VMs.
* IPs distintos para cada máquina.
* Memória: 1024 MB.
* CPU: 1 a 2 cores.
* Provisionamento realizado utilizando Shell Script.

## Configuração da VM Prod

O script `setup-prod.sh` realiza:

* Atualização dos pacotes do sistema.
* Instalação do Node.js e npm.
* Verificação da instalação através das versões do Node.js e npm.
* Exibição de mensagem de sucesso ou erro.

## Acessando as VMs

Após executar:

`vagrant up`

As máquinas podem ser acessadas com:

`vagrant ssh jenkins`

`vagrant ssh prod`

## Estrutura

`Vagrantfile`

`setup-jenkins.sh`

`setup-prod.sh`

## Tecnologias

* Vagrant
* VirtualBox
* Ubuntu Server
* Shell Script
* Node.js
* npm
* Jenkins
