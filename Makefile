TARGET_FILE = "repo_manager.sh"
PRJ_SRC = "${PWD}/src/main.sh"
PRJ_LIB = $(shell ls -d ${PWD}/lib/*) # All files from ./lib

export PRJ_LIB

SHELL := /bin/env bash
# all:  add_dependencies define_main invoke_main
 all:   invoke_main

invoke_main:
	echo -e "#!/usr/bin/env bash\n" > ${TARGET_FILE}
	for filename in $${PRJ_LIB[*]}; do cat $${filename} >> ${TARGET_FILE}; echo >> ${TARGET_FILE}; done
	echo -e "function main() {\n" >> ${TARGET_FILE}
	cat "${PRJ_SRC}" | sed -e 's/^/  /g' >> ${TARGET_FILE}
	echo -e "\n}\n" >> ${TARGET_FILE}
	echo "main \$$@" >> ${TARGET_FILE}

# invoke_main:

# add_dependencies:
