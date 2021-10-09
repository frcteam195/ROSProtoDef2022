all:
	@mkdir -p out
	@protoc --cpp_out=./out *.proto 
	cd out && g++ -c *.cc -I. && ar crf RobotComms.a *.o

clean:
	@rm -rf ./out
