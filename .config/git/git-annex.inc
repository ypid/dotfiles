[annex]
	backend = SHA512E

	; diskreserve = 30 GiB
	; This setting is expected to be configured by the sysadmin in
	; /etc/gitconfig because they know the role of the system best.
	; The diskreserve will be different for a file server than it is for a
	; client device.
	; Setting this here would overwrite /etc/gitconfig.

[remote "web"]
	; Can be overridden as needed with: a get -c 'remote.web.annex-ignore=false'
	; https://git-annex.branchable.com/tips/disabling_a_special_remote/
	annex-ignore = true
	annex-trustlevel = untrusted

[remote "bittorrent"]
	annex-trustlevel = untrusted
