# Stage 1: Build stage based on tfsec image
FROM ghcr.io/aquasecurity/tfsec:v1.28.5 AS tfsec
# Stage 2: Build stage based on tflint image
FROM ghcr.io/terraform-linters/tflint:v0.50.3 AS tflint
# Stage 3: Build stage based on terragrunt image
FROM alpine/terragrunt:1.8.0 As terragrunt
# Stage 4: Build stage based on atlantis image
FROM ghcr.io/runatlantis/atlantis:v0.28.1-alpine

# Install tfsec from the terragrunt image
RUN chown -R atlantis:atlantis /home/atlantis
USER atlantis
COPY --from=terragrunt /usr/local/bin/terragrunt /usr/local/bin/terragrunt
# Install tfsec from the tfsec image
COPY --from=tfsec /usr/bin/tfsec /usr/bin/tfsec
# Install tflint from the tflint image
COPY --from=tflint /usr/local/bin /usr/local/bin
