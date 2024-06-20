# 🌐 Atlantis VM Provisioning on GCP ☁️

<p>
<center>
  <img src="https://www.svgrepo.com/show/376353/terraform.svg" width="100" />
  <img src="https://static-00.iconduck.com/assets.00/google-cloud-icon-512x412-8rnz6wkz.png" width="100" /> 
  <img src="	https://www.runatlantis.io/hero.png" width="100" />
</center>
</p>


This repository contains Terraform code for provisioning a virtual machine on Google Cloud Platform (GCP) configured to run Atlantis, an application that provides automated and collaborative Terraform workflows via pull requests.

## 🗂️ Repository Structure

- `atlantis.yaml`: Contains atlantis configuration when dealing with the terraform.  
- `backend.tf`: Contains the Terraform state configuration.
- `compute.tf`: Contains the Terraform configuration to provision the VM and associated resources.
- `data.tf`: Defines data needed like secret manager.
- `Dockerfile`: Defines the atlantis image includes needed tools in case.
- `iam.tf`: Defines all the roles needed on teh project.
- `variables.tf`: Defines variables used in Terraform configurations.

- `README.md`: This file, providing an overview and setup instructions.

## 🔧 Prerequisites

- Google Cloud account
- Terraform installed
- Configured GCP service account with the necessary permissions
- Docker installed (for building custom container images)

## 🚀 Quick Start

1. **Clone the Repository:**

   ```bash
    git clone https://github.com/geekette86/gce-atlantis
    cd atlantis-gce
   ```

2. **Terraformize:**   

    ```bash
        terraform init
        terraform plan
        terraform apply
    ```

## 🐳 Building and Pushing the Docker Image  

To configure the Atlantis container, you need to build and push the Docker image to our artifacts registry.  

    `docker build -t custom-atlantis:{tag} -f Dockerfile .`
    `docker push custom-atlantis:{tag}`

## 🔒 Connect To the vm (OsLogin)

You need to assign the roles/compute.osLogin role to the user or group that requires access to the VM.  

    `gcloud compute ssh atlantis --tunnel-through-iap --zone europe-west1-b --project auto-atlantis` 

## 🤝 Contributions

Contributions are welcome! Please fork the repository and submit a pull request.

## 📜 License


