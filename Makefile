include config.mk

%: scripts/%.txt
	$(MAKE) SCRIPT=$< duckencode

utils/duckencoder.jar:
	mkdir -p utils
	wget https://github.com/hak5darren/USB-Rubber-Ducky/raw/master/duckencoder.jar -O utils/duckencoder.jar

duckencode: utils/duckencoder.jar
	${MOUNT_COMMAND}
	java -jar utils/duckencoder.jar -i ${SCRIPT} -o ${RUBBERDUCKY_STORAGE_PATH}/inject.bin
	${UNMOUNT_COMMAND}
	sync
