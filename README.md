# 🚀 Terraform Landing Zone – Security, Quality & Cost Scanning

This repository implements a **Terraform Landing Zone** using a **parent–child module architecture**, integrated with multiple **static analysis, security, cost, and testing tools** to ensure production‑grade Infrastructure as Code (IaC).

The goal of this project is to demonstrate **real‑world DevOps / Cloud best practices** around:

* Secure infrastructure provisioning
* Shift‑left security
* Cost visibility
* Automated quality gates
* Enterprise‑ready Terraform module design

---

## 📌 Key Highlights

✅ Parent–Child (Root–Module) Terraform structure
✅ Modular, reusable Azure resources
✅ Security & compliance scanning baked into CI/CD
✅ Static code analysis for Terraform
✅ Cost estimation before deployment
✅ Terraform best‑practice validation

---

## 🏗️ Repository Structure

```bash
LANDINGZONE-SCANNINGTOOLS/
│
├── .scannerwork/              # Scanner runtime artifacts
├── Environment/
│   └── dev/                   # Environment‑specific configurations
│
├── modules/                   # Reusable child modules
│   ├── acr/
│   ├── asg/
│   ├── bastion/
│   ├── compute/
│   ├── key_vault/
│   ├── networking/
│   ├── nsg/
│   ├── public_ip/
│   ├── resource_group/
│   ├── sql_db/
│   ├── sql_server/
│   └── storage/
│
├── test/                      # Terraform test cases
├── azure-pipelines.yml        # CI/CD pipeline
├── terraform.tfstate          # State file (local – demo purpose)
│
├── checkov_report.json
├── tflint_report.json
├── tfsec_report.json
├── terrascan_report.json
│
└── README.md
```

---

## 🧱 Architecture Approach

### 🔹 Parent (Root) Module

* Defines **provider configuration**
* Manages **backend & environment variables**
* Calls child modules
* Orchestrates resource dependencies

### 🔹 Child Modules

* Each Azure service is isolated into a **single responsibility module**
* Promotes:

  * Reusability
  * Maintainability
  * Scalability
  * Clear ownership

Example:

```hcl
module "networking" {
  source = "../../modules/networking"
  vnet_name = var.vnet_name
}
```

---

## 🔐 Tools Integrated & Their Purpose

### 1️⃣ Checkov – Policy as Code (Security & Compliance)

🔹 **What it does**
Static analysis tool for Terraform that checks against **CIS, Azure Security Benchmark & custom policies**.

🔹 **Why used**

* Detects misconfigurations early
* Enforces security guardrails

🔹 **Output**

* `checkov_report.json`

---

### 2️⃣ TFLint – Terraform Linting

🔹 **What it does**
Validates Terraform code for:

* Syntax issues
* Deprecated arguments
* Provider‑specific best practices

🔹 **Why used**

* Cleaner code
* Fewer runtime surprises

🔹 **Output**

* `tflint_report.json`

---

### 3️⃣ TFSec – Security Scanner

🔹 **What it does**
Performs **deep security analysis** on Terraform code.

🔹 **Catches issues like**

* Open NSG rules
* Public storage accounts
* Missing encryption

🔹 **Output**

* `tfsec_report.json`

---

### 4️⃣ Infracost – Cost Estimation 💰

🔹 **What it does**
Estimates monthly cloud cost **before deployment**.

🔹 **Why used**

* Prevents unexpected billing
* Enables cost‑aware decisions

🔹 **Shift‑left benefit**
Cost visibility directly in Pull Requests / Pipelines.

---

### 5️⃣ Terratest – Infrastructure Testing 🧪

🔹 **What it does**
Validates deployed infrastructure using automated tests.

🔹 **Tests include**

* Resource existence
* Outputs validation
* Networking connectivity

🔹 **Location**

```bash
test/
```

---

### 6️⃣ Terrascan – Compliance & Policy Enforcement

🔹 **What it does**
Scans Terraform code against **enterprise‑grade compliance policies**.

🔹 **Why used**

* Regulatory compliance
* Cloud security posture management (CSPM)

🔹 **Output**

* `terrascan_report.json`

---

## 🔁 CI/CD Pipeline Flow (Azure DevOps)

```text
Code Push
   ↓
Terraform Init
   ↓
TFLint
   ↓
Checkov
   ↓
Tfsec
   ↓
Terrascan
   ↓
Infracost
   ↓
Terraform Plan
   ↓
Terraform Apply (Approval)
```

✔ Quality & Security gates stop the pipeline on failures

---

## 🎯 Why This Project Matters

This project reflects **real enterprise DevOps practices**:

* Shift‑left security
* Cost governance
* IaC quality enforcement
* Modular Terraform design

It is suitable for:

* DevOps Engineers
* Cloud Engineers
* Platform / Landing Zone teams
* Interview & portfolio demonstration

---

## 🧠 Future Enhancements

* Remote backend (Azure Storage + State Locking)
* Policy as Code via OPA
* Multi‑environment promotion (dev → test → prod)
* GitHub Actions support
* SARIF report integration

---

## 🤝 Contributions

Feel free to fork, raise PRs, or suggest improvements.

---


