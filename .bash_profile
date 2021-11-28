function homestead() {
	( cd Homestead && vagrant $* )
}

# make flutter command globally available
export PATH="$PATH:/Users/wesselsmit/flutter/bin"
