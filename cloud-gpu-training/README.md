*** Documentation

An example of setting up remote cloud environment for training a machine learning model using [Terraform Provider Iterative](https://github.com/iterative/terraform-provider-iterative).

See the [terraform registry](https://registry.terraform.io/providers/iterative/iterative/latest/docs).

For future reference: https://github.com/iterative/blog-tpi-jupyter
*** iterative_task
This resource will:

1. Create cloud resources (storage, machines) for the task.
2. If specified, upload a local working directory to the cloud storage.
3. Run the given script in the cloud until completion, error, or timeout.
4. If specified, download output results.
5. Automatically terminate compute resources upon task completion.

*** GPU ("example-gpu")
You can install all the required drivers and dependencies "manually" via a script, you can use an existing Docker image, build your own, or just use the convenient nvidia image pre-packaged with CUDA 11.3 GPU drivers.

*** CPU Script for Reference
#+begin_src
# Basic (CPU) version
# This task is the only resource the iterative provider offers
# example-basic is simply the name of the TF resource defined here
resource "iterative_task" "example-basic" {
  cloud   = "aws"    # or any of: gcp, az, k8s
  machine = "m"      # medium. Or any of: l, xl, m+k80, xl+v100, ... defined in docs
  spot    = 0        # auto-price. Default -1 to disable, or >0 for hourly USD limit
  timeout = 24*60*60 # 24h
  image   = "ubuntu"

  storage {
    workdir = "src" # relative to root
    output  = "results-basic" # relative to workdir
  }
  environment = { TF_CPP_MIN_LOG_LEVEL = "1" }
  script = <<-END
    #!/bin/bash
    sudo apt-get update -q
    sudo apt-get install -yq python3-pip
    pip3 install -r requirements.txt tensorflow-cpu==2.8.0
    python3 train.py --output results-basic/metrics.json
  END
}
#+end_src
