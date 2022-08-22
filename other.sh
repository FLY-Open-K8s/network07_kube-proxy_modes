iptables -n -t nat -L KUBE-SERVICES

[root@gv187 ~]# iptables -n -t nat -L KUBE-SERVICES
Chain KUBE-SERVICES (2 references)
target     prot opt source               destination
KUBE-SVC-NPX46M4PTMTKRN6Y  tcp  --  0.0.0.0/0            10.0.0.1             /* default/kubernetes:https cluster IP */ tcp dpt:443
KUBE-NODEPORTS  all  --  0.0.0.0/0            0.0.0.0/0            /* kubernetes service nodeports; NOTE: this must be the last rule in this chain */ ADDRTYPE match dst-type LOCAL

[root@gv187 ~]# iptables -n -t nat -L KUBE-SVC-NPX46M4PTMTKRN6Y
Chain KUBE-SVC-NPX46M4PTMTKRN6Y (1 references)
target     prot opt source               destination
KUBE-SEP-HUYPNR7YGPKAE3WK  all  --  0.0.0.0/0            0.0.0.0/0            /* default/kubernetes:https */
