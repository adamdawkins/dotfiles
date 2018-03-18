bpm() {
	help="
	Usage: bpm <command>

	where <command> is one of:
	a, add, d, dev, i, install,
	r, remove, u, uninstall

	or where <command> is a task you would like to run

	bpm add|a|i|install       npm install --save
	bpm dev|d                 npm install --save-dev
	bpm remove|r|u|uninstall  npm uninstall --save
	bpm <command>             npm run <command>
	"

	cmd=""

	if [ -f .meteor/packages ]; then
		# if there"s a local .meteor directory, use `meteor npm`
		# testing for .meteor/packages is how Meteor tests if you"re in a Meteor app (see https://github.com/meteor/meteor/blob/devel/tools/fs/files.js#L100)
		cmd="$cmd meteor"
	fi

	cmd="$cmd npm"

	case "$1" in

		add|a|i|install)
			cmd="$cmd install --save $2"
		;;

		remove|r|u|uninstall)
			cmd="$cmd uninstall --save $2"
		;;

		dev|d)
			cmd="$cmd install --save-dev $2"
		;;

		# default
		*)
			if [ "$1" = "" ]; then
				echo "${help}"
			else
				cmd="$cmd run $1"
			fi
		;;

    esac

	if [ "$1" != "" ]; then
		echo $cmd
		eval $cmd
	fi
}
