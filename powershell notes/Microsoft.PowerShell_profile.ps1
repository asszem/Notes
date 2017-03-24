set-alias vim "C:\Program Files (x86)\Vim\vim80\gvim.exe"
Function GitHubLocation
{
	cd E:\GitHub\
}
set-alias gogit GitHubLocation

# To edit the Powershell Profile
# (Not that I'll remember this)
Function Edit-Profile
{
    vim $profile
}

# To edit Vim settings
Function Edit-Vimrc
{
    vim $HOME\_vimrc
}
