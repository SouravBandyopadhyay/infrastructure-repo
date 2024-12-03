- To access your eks clutster, geneate the kubeconfig with below command
    `aws eks update-kubeconfig --name <cluster-name> --region <region>`

- And here we go. You can start using the kubectl commands.
    `kubectl get pods`