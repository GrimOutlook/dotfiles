#!/usr/bin/env fish

function drive-mount
    # It looks dumb because both the `match` statement and the command string need to have the dollar sign
    # escaped which means the escape needs to be escaped which required another escape to escape the escapes
    # escape. Confused yet? Me neither.
    set DRIVE_LETTERS (powershell.exe '(Get-PSDrive).Root -match \'^[a-z]:\\\\$\'' | cut -d ":" -f 1)
    for LETTER in $DRIVE_LETTERS
        set letter (echo $LETTER | tr '[:upper:]' '[:lower:]')
	set mount_path "/mnt/$letter"
	if test -d $mount_path
        continue
	end
	echo "Mounting drive $LETTER:\\ to $mount_path"
	sudo mkdir -p $mount_path
	sudo mount -t drvfs $LETTER: $mount_path

    end
end
