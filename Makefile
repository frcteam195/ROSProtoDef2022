all:
	@mkdir -p out
	@../CKROSprotobuf/build/protoc --cpp_out=./out *.proto 
	cd out && g++ -I. -I../../CKROSprotobuf/src/ -c *.cc && ar crf RobotComms.a *.o

clean:
	@rm -rf ./out
