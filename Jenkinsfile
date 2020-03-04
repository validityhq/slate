#!/usr/bin/groovy

def prNumber = env.CHANGE_ID
def branchName = BRANCH_NAME
def pipelineOverrides = [ 'image.repository': "024716640333.dkr.ecr.us-east-1.amazonaws.com/bv-slate-docs" ]

rpPipeline() {
    imageName = "bv-slate-docs"
    imageRepo = "https://024716640333.dkr.ecr.us-east-1.amazonaws.com"
    deployName = "bv-slate-docs"
    helmDir = "helm/bv-slate-docs"
    overrideYaml = "workload2-us-east-1-bv-sandbox.yaml"
    deployClusters = [ 'workload2-us-east-1-bv-sandbox' ]

    switch (branchName) {
      case "master":
        deployName = "bv-slate-docs"
        break

      default:
        deployName = "bv-slate-docs-${prNumber}"
    }

    if (prNumber != null) {
      pipelineOverrides.put('dns.dnsName', "${deployName}.bv-sandbox.validity.com")
    }

    overrides = pipelineOverrides
}

