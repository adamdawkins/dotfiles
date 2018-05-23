# help text when just running `bpm`
help="
Usage: bpm <command> <flag> <packages>

where <command> is one of:
    a, add, i, install,
    r, remove, u, uninstall

and where <flag> is one of:
    -h, -d, -g

and where <packages> is one or many npm package names

bpm add|a|i|install       npm install --save
bpm i -d                  npm install --save-dev
bpm remove|r|u|uninstall  npm uninstall --save
bpm u -d                  npm uninstall --save-dev
bpm <package>             npm run <package>
"

bpm() {
	cmd=""

	if [ -f .meteor/packages ]; then
		# if there"s a local .meteor directory, use `meteor npm`
		# testing for .meteor/packages is how Meteor tests if you"re in a Meteor app (see https://github.com/meteor/meteor/blob/devel/tools/fs/files.js#L100)
		cmd="$cmd meteor"
	fi

	cmd="$cmd npm"
	# scope will be --save --save-dev or -g
	scope="--save"
	# action will be one of install or uninstall
	action=""
	# packages will be the list of npm package names
	packages=""

	# $0 is all the parameters provided after the bpm command
	for argument in $@
	do
		# The conditions
		case $argument in
			-h) echo "${help}" ;;
			-d) scope="--save-dev" ;;
			-g) scope="-g" ;;
			add|a|i|install) action="install" ;;
			remove|r|u|uninstall) action="uninstall" ;;
			# for all other arguments, add to the list of packages
			*) packages="$packages $argument"
		esac
	done

	# if the command contains packages, we can run or (un)install them
	if [ "$packages" != "" ]; then
		# if there's an action, use that, otherwise we'll run the package
		if [ "$action" != "" ]; then
			cmd="$cmd $action"

			# we only care about scope if an action other than run is involved
			if [ "$scope" != "" ]; then
				cmd="$cmd $scope"
			fi
		else
			cmd="$cmd run"
		fi

		cmd="$cmd $packages"

		echo $cmd
		eval $cmd
	# special exception for when you want to just run `bpm i` and nothing else
	elif [ "$action" == "install" ]; then
		echo "npm i"
		eval "npm i"
	else
		echo "${help}"
	fi
}
