all:
	make native
	make aarch64

native:
	@mkdir -p out
	@mkdir -p out/native
	@../CKROSprotobuf/build/native/protoc --cpp_out=./out *.proto 
	cd out/native && g++ -fPIC -I. -I../../../CKROSprotobuf/src/ -c ../*.cc && ar crf RobotComms.a *.o

aarch64:
	@mkdir -p out
	@mkdir -p out/aarch64
	@cd ../CKROSprotobuf/ && make native
	@../CKROSprotobuf/build/native/protoc --cpp_out=./out *.proto 
	cd out/aarch64 && /jetsontoolchain/bin/aarch64-linux-gnu-g++ -fPIC -I. -I../../../CKROSprotobuf/src/ -c ../*.cc && /jetsontoolchain/bin/aarch64-linux-gnu-ar crf RobotComms.a *.o

clean:
	@rm -rf ./out
