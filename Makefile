all:
	make native
	make aarch64

x86_64:
	@mkdir -p out
	@mkdir -p out/native
	@../CKROSprotobuf/build/x86_64/protoc --cpp_out=./out *.proto 
	cd out/native && g++ -I. -I../../../CKROSprotobuf/src/ -c ../*.cc && ar crf RobotComms.a *.o

aarch64:
	@mkdir -p out
	@mkdir -p out/aarch64
	@../CKROSprotobuf/build/x86_64/protoc --cpp_out=./out *.proto 
	cd out/aarch64 && /jetsontoolchain/bin/aarch64-linux-gnu-g++ -I. -I../../../CKROSprotobuf/src/ -c ../*.cc && /jetsontoolchain/bin/aarch64-linux-gnu-ar crf RobotComms.a *.o

clean:
	@rm -rf ./out
