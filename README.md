# SNS_Final-project  :  ICS-Auditor  
### A ICS/OT Misconfiguration Detection Lab Using Docker & Python

ICS-Auditor is a small-scale Industrial Control System (ICS) security project designed to analyze misconfigurations in an emulated IT/OT network. It demonstrates how insecure ports, weak services, and segmentation violations can enable attacks on operational technology environments.

This project is intentionally lightweight, reproducible, and academically focused—perfect for coursework, research surveys, and teaching demonstrations.

---

## 🚀 Features

- Docker-based simulation of an ICS/OT environment  
- Modbus TCP server (representing a PLC)  
- FTP & SSH services (common insecure/legacy IT components)  
- Python auditing engine to detect:
  - Dangerous open ports  
  - IT-to-OT segmentation violations  
  - Policy conflicts  
- YAML-based security rules  
- JSON-based configuration inputs  
- Exported JSON misconfiguration report  

---

## 📁 Project Structure

```
ics-auditor/
│
├── docker-compose.yml
│
├── auditor/
│   ├── Dockerfile
│   ├── analyze.py
│   ├── audit_rules.yml
│   ├── sample/
│   │     ├── network.json
│   │     ├── firewall.json
│   │     └── routing.json
│   └── output/
│         └── report.json   (generated automatically)
│
└── services/
    ├── modbus/
    │     ├── Dockerfile
    │     └── modbus_server.py
    ├── ftp/
    │     └── Dockerfile
    └── ssh/
          └── Dockerfile
```

---

## 🧠 How It Works

### 1. **Docker Compose builds and launches four services:**

| Service | Port | Purpose |
|---------|------|---------|
| Modbus TCP | 502 | Simulates a PLC device |
| FTP Server | 2121 | Demonstrates insecure legacy service |
| SSH Server | 2222 | Simulates remote admin access |
| Auditor | — | Runs misconfiguration analysis |

Start everything:

```bash
docker compose up -d
```

---

### 2. **The Auditor Loads:**

#### a. *Security Rules* — `audit_rules.yml`

```yaml
dangerous_ports:
  - 21
  - 23
  - 502

forbidden_it_to_ot:
  - "IT-MGMT -> PLC1"
```

#### b. *Network Topology* — `network.json`

```json
{
  "hosts": {
    "PLC1": { "open_ports": [502] },
    "FTP-SERVER": { "open_ports": [21] },
    "SSH-SERVER": { "open_ports": [22] },
    "IT-MGMT": { "open_ports": [22, 23] }
  },
  "edges": [
    { "src": "IT-MGMT", "dst": "PLC1" }
  ]
}
```

---

### 3. **Misconfiguration Detection Logic**

The auditor detects:

#### ✔ Dangerous Services
- FTP (21) — cleartext  
- Telnet-like (23) — legacy remote management  
- Modbus (502) — critical OT protocol exposed to IT  

#### ✔ Segmentation Violations
Example:
```
IT-MGMT -> PLC1
```
This represents an unsafe path from IT into OT, enabling potential control-channel compromise.

---

### 4. **Output: JSON Report**

Created under:

```
auditor/output/report.json
```

Example:

```json
{
  "dangerous_open_ports": [
    { "host": "PLC1", "port": 502 },
    { "host": "FTP-SERVER", "port": 21 },
    { "host": "IT-MGMT", "port": 23 }
  ],
  "segmentation_violations": [
    "IT-MGMT -> PLC1"
  ]
}
```

---

## 🧪 Running the Project

Start entire lab:

```bash
docker compose up -d
```

Check running containers:

```bash
docker ps
```

Stop environment:

```bash
docker compose down
```

---

## 🔧 Extending the Auditor

tool can be expanded by adding:

- SSH weak cipher detection  
- Cleartext protocol warnings  
- Firewall rule validation  
- Network graph visualization (NetworkX)  
- Risk scoring based on asset criticality  
- Additional PLC simulators (BACnet, DNP3)  

---

## 🏁 Summary

ICS-Auditor provides a clean, realistic, and reproducible environment to study ICS misconfigurations and segmentation issues.  
It balances simplicity with technical depth, making it suitable for both academic evaluation and practical demonstration.

---

If you use this project in research or academic work, please consider citing or referencing your implementation.

