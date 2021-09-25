all:
	@mkdir -p out
	@protoc --cpp_out=./out *.proto 

clean:
	@rm -rf ./out