# Projeto: Alta Disponibilidade com Nginx Load Balancer na AWS

## 📌 Visão Geral
[cite_start]Este projeto implementa uma arquitetura web de alta disponibilidade na AWS utilizando um **Load Balancer customizado**[cite: 34]. O objetivo é garantir a resiliência do ambiente através da distribuição de carga entre múltiplos servidores utilizando o **Nginx**.

## 🛠 Tecnologias Utilizadas
* [cite_start]**AWS** (EC2, Security Groups) [cite: 35]
* **Nginx** (Load Balancer e Proxy Reverso)
* [cite_start]**Apache/Bash** (Servidor Web e Automação) [cite: 35]

## ⚙️ Arquitetura
1. **Load Balancer:** Instância EC2 dedicada rodando Nginx como ponto único de entrada.
2. [cite_start]**Nodes de Backend:** Duas instâncias rodando Apache com identificadores exclusivos para validação[cite: 35].
3. **Distribuição de Carga:** Configuração de upstream com algoritmo Round Robin para alternância de tráfego.
4. **Segurança:** Security Group configurado para permitir tráfego HTTP na porta 80.
5. **Troubleshooting:** Implementação via software para contornar restrições de provisionamento nativo (ALB).

## 📸 Prova de Conceito (PoC)
![Teste Servidor 01](Servidor1.png)
![Teste Servidor 02](Servidor2.png)
