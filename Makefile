.PHONEY: all network infra domain remote-state install destroy

key:
	@terraform output private_key > /tmp/.openshift-`terraform output cluster_name`.key
	@chmod 600 /tmp/.openshift-`terraform output cluster_name`.key

sshspec:
	@terraform output bastion_ssh_spec

ssh-bastion: key
	@ssh -o IdentitiesOnly=yes `make sshspec` -i /tmp/.openshift-`terraform output cluster_name`.key -vvv
	#@ssh `make sshspec` -i /tmp/.openshift-`terraform output cluster_name`.key -vvv

ssh-master: key
	#@ssh -o IdentitiesOnly=yes core@54.217.21.220 -i /tmp/.openshift-`terraform output cluster_name`.key -vvv
	#@ssh -J `make sshspec` core@54.217.21.220 -i /tmp/.openshift-`terraform output cluster_name`.key -vvv
	@ssh -i /tmp/.openshift-`terraform output cluster_name`.key -Ao ProxyCommand="/tmp/.openshift-`terraform output cluster_name`.key -W %h:%p `make sshspec`" core@172.24.25.151 -vvv
