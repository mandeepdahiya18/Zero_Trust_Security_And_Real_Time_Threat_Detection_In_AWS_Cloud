# 🛡️ Zero-Trust Cloud Security Using AWS GuardDuty & Suricata IDS

A complete Zero-Trust cloud monitoring environment built using **AWS GuardDuty**, **Suricata IDS**, and an **Apache Web Server** on AWS EC2.  
This project detects **port scans**, **credential misuse**, and suspicious network behavior using both cloud-native and host-based intrusion detection.

---

## 📌 Project Overview

This project demonstrates how to build a **multi-layered Zero-Trust detection system** using AWS Free Tier and open-source tools.

It integrates:

- **AWS GuardDuty** – Cloud-native threat detection  
- **Suricata IDS/IPS** – Host-level deep packet inspection  
- **Apache Web Server** – Public-facing workload  
- **Simulated Attacks** – Port scan & root credential misuse  

This setup provides **end-to-end visibility** across API logs, network traffic, and packet-level behavior.

---

## 🚀 Features

### ✔ Cloud-Level Detection (GuardDuty)
Detects:
- Port scans  
- Root credential misuse  
- Anomalous DNS activity  
- Unusual outbound behavior  

### ✔ Host-Level Detection (Suricata)
Monitors:
- Suspicious packets  
- Scan signatures  
- HTTP, DNS, and TLS anomalies  

### ✔ Real Attack Simulation
- Nmap port scanning  
- Apache traffic inspection  
- Credential misuse tests  

### ✔ Reporting & Analysis
- GuardDuty security findings  
- Suricata alerts in `eve.json`  
- Apache logs  

---

## 🔧 Technology Stack

| Layer | Tools |
|------|--------|
| Cloud Security | AWS GuardDuty, CloudTrail, VPC Flow Logs |
| Host Security | Suricata IDS/IPS |
| Web Server | Apache |
| Infrastructure | AWS EC2 (Ubuntu 22.04) |
| Scripts | Bash Shell |

---

## 🧩 System Architecture
Architecture diagram is available in:

📁 `architecture/system_architecture.png`

---

## ⚙️ Installation Guide

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/<your-username>/zero-trust-cloud-security.git
cd zero-trust-cloud-security

