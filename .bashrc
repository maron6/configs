HISTSIZE=10000 # No Limit on history count
HISTFILESIZE=100000
alias ls='lsd'
alias la='lsd -a'
alias lt ='lsd --tree'

#  ToDo: play around with Nix VMs
function nix-vm-run() {
	# Default. See https://nixos.wiki/wiki/Nixos-rebuild - `build-vm` option
	nixVM=""
	if [ -z "$1"]; then
		echo "Default Profile"
		nixVM="/etc/nixos/result/bin/run-nixos-vm"
	else	
		echo "Non Default Profile"
		nixVM="/etc/nixos/result/bin/run-$1-vm"
	fi
	# echo "# '$nixVM'"
	# echo "Test statement: Executable file not found at '$nixVM' - you may need to run \"nixos-rebuild build-vm\""

	# return 0
	# if VM is found and can be executed, then call running it.
	if [ -x "$nixVM"]; then
		"$nixVM"
	else
		# NOTE: Backticks will create a subcommand and try to call that.... so don't do that...
		echo "Executable file not found at $nixVM - you may need to run \"nixos-rebuild build-vm\""
	fi
}
# Run Yazi and switch shell context to the cwd from yazi after quitting (q only - Q quits without changing)
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export -f nix-vm-run
export -f y
