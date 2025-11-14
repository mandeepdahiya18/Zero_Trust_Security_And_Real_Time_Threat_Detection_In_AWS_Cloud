🛡️ Zero-Trust Cloud Security Using AWS GuardDuty & Suricata IDS

A complete Zero-Trust security monitoring environment built using AWS GuardDuty, Suricata IDS, and Apache Web Server running on an EC2 instance.
The system detects port scans, root credential misuse, and suspicious network behavior through cloud-native and host-level intrusion detection.

📌 Project Overview

This project demonstrates how to build a multi-layered Zero-Trust detection system using only AWS Free Tier components and open-source tools.

It integrates:

AWS GuardDuty – Cloud-native threat detection

Suricata IDS/IPS – Host-based deep packet inspection

Apache Web Server – Public-facing workload

Simulated Attacks – Port scans & credential misuse

The architecture provides comprehensive visibility across network traffic, API logs, and host behavior.

📁 Repository Structure
zero-trust-aws-guardduty-suricata/
│
├── README.md
├── architecture/
│   └── system_architecture.png
│
├── screenshots/
│   ├── ec2_apache_running.png
│   ├── guardduty_findings.png
│   ├── suricata_running.png
│   ├── eve_log_sample.png
│   └── apache_page.png
│
├── suricata/
│   ├── suricata.yaml
│   └── logs/
│       └── eve.json
│
├── scripts/
│   ├── install_suricata.sh
│   ├── setup_apache.sh
│   ├── update_rules.sh
│   └── portscan_test.sh
│
└── documentation/
    ├── final_report.pdf
    └── ppt.pdf

🚀 Features
✔ Cloud-Level Threat Detection

Uses AWS GuardDuty to detect:

Port scans

IAM root credential misuse

Anomalous DNS traffic

Unusual outbound connections

✔ Host-Level Packet Inspection

Suricata monitors:

Suspicious packets

Scan signatures

Reconnaissance traffic

HTTP, DNS, TLS behavior

✔ Real-World Attack Simulation

Nmap port scan

Root credential misuse

Public HTTP exposure

✔ Complete Reporting

GuardDuty security findings

Suricata alerts in eve.json

Apache request logs

🔧 Technology Stack
Layer	Tools Used
Cloud Security	AWS GuardDuty, CloudTrail, VPC Flow Logs
Host Security	Suricata IDS/IPS
Web Server	Apache2 on Ubuntu
Infrastructure	AWS EC2
OS	Ubuntu 22.04 LTS
Scripts	Bash (installation, updates, testing)
🧩 System Architecture

Include the generated architecture image:

architecture/system_architecture.png

⚙️ Installation Guide
1️⃣ Clone This Repository
git clone https://github.com/<your-username>/zero-trust-cloud-security.git
cd zero-trust-cloud-security

2️⃣ Setup Apache Web Server
sudo ./scripts/setup_apache.sh

3️⃣ Install Suricata IDS
sudo ./scripts/install_suricata.sh

4️⃣ Update Suricata Rules
sudo ./scripts/update_rules.sh

5️⃣ Verify Suricata Is Running
sudo systemctl status suricata

🧪 Testing the Detection System
▶ Simulate Port Scan

(This triggers both GuardDuty and Suricata)

sudo ./scripts/portscan_test.sh <EC2-PUBLIC-IP>

▶ View Suricata Alerts
sudo cat /var/log/suricata/eve.json

▶ Check GuardDuty Alerts

Go to:
AWS Console → GuardDuty → Findings

📊 Results & Findings
GuardDuty Detected:

🟥 Recon:EC2/Portscan

🟧 IAM:RootCredentialUsage

🟨 Behavioral anomalies

Suricata Logged:

Suspicious packet flows

Scan attempts

Alerts in eve.json

Apache Server:

Public website accessible

Simulated traffic captured in logs

🚧 Challenges Faced

Missing Suricata rules (resolved with ET rules)

IAM misconfiguration risks

Understanding log correlation between host and cloud

Ensuring EC2 security while public-facing

🛡️ Future Improvements

Enable Suricata IPS mode

Integrate SIEM (ELK or CloudWatch Logs)

Terraform IaC automation

Lambda-based automated remediation

ML-driven anomaly detection

Network segmentation using subnets

📄 Documentation Included

Inside /documentation/:

Final report PDF

PowerPoint presentation

🤝 Contributing

Contributions, pull requests, and improvements are welcome.

📜 License

This project is released under the MIT License.

⭐ Show Your Support

If you found this useful, consider ⭐ starring the repo!