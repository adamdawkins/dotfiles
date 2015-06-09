function glog --description 'Pretty Git Log'
	git log --pretty=format:'%Cred%h%Creset %s %C(yellow)%an%Creset' --graph
end
