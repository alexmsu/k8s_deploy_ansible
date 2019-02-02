### k8s deploy ansible

    ```
    ansible-playbook -i inventory --ask-sudo-pass kube_cluster.yml -t [deploy | run | join | stop | fetch]
    ```
