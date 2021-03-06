clean:
	[ -d build ] || mkdir build; rm -rf ./build/* || true
prepare_build:
	([ -d project-temp ] || mkdir project-temp) && rm -rf project-temp/* && cp Gemfile* project-temp/ && cp bin/metanorma project-temp/
compile:
	CPPFLAGS="-P" CC="clang" CXX="clang++" ruby /archive/work/metanorma/ruby_packer_orig/ruby-packer/bin/rubyc --clean-tmpdir -r project-temp/ -o build/metanorma project-temp/metanorma
clean_temp_build:
	rm -rf /tmp/project-temp/
build: clean prepare_build compile clean_temp_build
