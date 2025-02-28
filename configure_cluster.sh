prometheus_secret_name=prometheus-credentials
prometheus_secret_path="./secrets/prometheus/password"

echo "----------------------------------"
echo "Create namespaces"
kubectl apply -f ./namespaces.yaml

echo "----------------------------------"
echo "Create secrets"

echo "In namespace prometheus"
kubectl create secret generic $prometheus_secret_name --from-file=password=$prometheus_secret_path -n monitoring --dry-run=client -oyaml | kubectl apply -f -
