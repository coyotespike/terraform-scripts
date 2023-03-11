# The iterative.ai terraform module, from the tf registry
terraform {
  required_providers { iterative = { source = "iterative/iterative" } }
}

provider "iterative" {}

# GPU version
resource "iterative_task" "example-gpu" {
  cloud   = "aws"
  machine = "m+t4" # 4 CPUs and an NVIDIA Tesla T4 GPU
  spot    = 0
  timeout = 24 * 60 * 60
  image   = "nvidia" # has CUDA GPU drivers

  storage {
    workdir = "src"
    output  = "results-gpu"
  }
  environment = { TF_CPP_MIN_LOG_LEVEL = "1" }
  script      = <<-END
    #!/bin/bash

    sudo apt-get update -q

    sudo apt-get install -yq python3-pip
    pip3 install -r requirements.txt tensorflow==2.8.0
    python3 train.py --output results-gpu/metrics.json
  END
}
