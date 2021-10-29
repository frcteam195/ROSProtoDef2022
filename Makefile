all:
	make x86_64
	make aarch64

x86_64:
	@mkdir -p out
	@mkdir -p out/x86_64
	@../CKROSprotobuf/build/x86_64/protoc --cpp_out=./out *.proto 
	cd out && g++ -I. -I../../CKROSprotobuf/src/ -c *.cc && ar crf x86_64/RobotComms.a *.o

aarch64:
	@mkdir -p out
	@mkdir -p out/aarch64
	@../CKROSprotobuf/build/x86_64/protoc --cpp_out=./out *.proto 
	cd out && /jetsontoolchain/bin/aarch64-linux-gnu-g++ -I. -I../../CKROSprotobuf/src/ -c *.cc && /jetsontoolchain/bin/aarch64-linux-gnu-ar crf aarch64/RobotComms.a *.o

clean:
	@rm -rf ./out
