# cloudlab-keda-cluster/scripts

A collection of scripts for configuring the Kubernetes cluster and its nodes.

## delete_metrics_server.sh

```bash
kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

## delete_node.sh

```bash
NODE=$1

kubectl drain $NODE --ignore-daemonsets --delete-emptydir-data
kubectl delete node $NODE
```

## delete_prometheus.sh

```bash
# Delete the YAML file under yaml/prometheus.yaml
kubectl delete -f https://raw.githubusercontent.com/m-sef/cloudlab-auto-keda-cluster/main/yaml/prometheus.yaml
```

## disable_hyperthreading.sh

```bash
echo "off" | sudo tee /sys/devices/system/cpu/smt/control
```

## disable_turboboost.sh

```bash
echo "1" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo
```

## enable_hyperthreading.sh

```bash
echo "on" | sudo tee /sys/devices/system/cpu/smt/control
```

## enable_turboboost.sh

```bash
echo "0" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo
```

## init_as_master.sh

Usage: `init_as_master`

Initializes a Kubernetes cluster.

## init_k8s.sh

Usage: `init_k8s`

Runs `is_master`. If this node is the 'master' node, than this script runs `init_as_master`, otherwise, this script runs `join_as_worker`.

## install_helm.sh

```bash
sudo snap install helm --classic

# Workaround for "home directories outside of /home needs configuration." snap error
sudo snap set system homedirs=~/..
```

## install_keda.sh

```bash
# To deploy KEDA using Helm, first add the official KEDA Helm repository:
helm repo add kedacore https://kedacore.github.io/charts
helm repo update

# Install keda by running:
helm install keda kedacore/keda --namespace keda --create-namespace
```

## install_metrics_server.sh

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

## install_prometheus.sh

```bash
# Apply the YAML file under yaml/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/m-sef/cloudlab-auto-keda-cluster/main/yaml/prometheus.yaml
```

## is_master.sh

Usage: `is_master`

Echos "MASTER" on success and returns exit code 0, otherwise, fail with exit code 1.

## join_as_worker.sh

Usage: `join_as_worker`

Attempts to join the Kubernetes cluster as a worker node.

## set_all_cores_policy

Usage: `set_all_cores_policy POLICY`

Applies the provided policy (e.g. performance, powersave, etc.) to all CPUs via `cpufreq-set`

```bash
POLICY=$1

for ((i=0; i<$(nproc); i++)); do sudo cpufreq-set --cpu $i --governor $1; done
cpufreq-info
```

## setup.sh

Automatically run by `profile.py`. Downloads several dependencies (e.g. docker, kubeadm, kubectl, kubelet, etc.) as well as configures several configurations files which Kubernetes depends on.