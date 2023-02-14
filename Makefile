all: handin.tgz

handin.tgz:
	tar cvzf * $@
