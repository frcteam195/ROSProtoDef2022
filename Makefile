ARCH := $(shell arch)

all:
	make $(ARCH)

x86_64:
	@mkdir -p out
	@mkdir -p out/x86_64
	@protoc --cpp_out=./out *.proto 
	cd out/x86_64 && g++ -fPIC -I. -I../../../CKROSprotobuf/src/ -c ../*.cc && ar crf RobotComms.a *.o

arm64 aarch64:
	@mkdir -p out
	@mkdir -p out/aarch64
	@protoc --cpp_out=./out *.proto 
	cd out/aarch64 && g++ -fPIC -I. -I../../../CKROSprotobuf/src/ -c ../*.cc && ar crf RobotComms.a *.o

clean:
	@rm -rf ./out
