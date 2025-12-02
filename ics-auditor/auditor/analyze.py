import json, yaml
import networkx as nx

with open("audit_rules.yml") as f:
    rules = yaml.safe_load(f)

with open("sample/network.json") as f:
    net = json.load(f)

report = {
    "dangerous_open_ports": [],
    "segmentation_violations": []
}

for host, info in net["hosts"].items():
    for port in info.get("open_ports", []):
        if port in rules["dangerous_ports"]:
            report["dangerous_open_ports"].append({
                "host": host,
                "port": port
            })

for link in net["edges"]:
    path = f"{link['src']} -> {link['dst']}"
    if path in rules["forbidden_it_to_ot"]:
        report["segmentation_violations"].append(path)

with open("output/report.json", "w") as f:
    json.dump(report, f, indent=2)

print("[✓] Misconfiguration analysis complete")
