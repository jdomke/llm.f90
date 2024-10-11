# Cloning the repo
```
git clone --recurse-submodules https://github.com/jdomke/llm.f90.git
```

# Building release
```
pushd zfp && rm -rf build && mkdir build
pushd build && cmake .. -DBUILD_ZFORP=1 -DCMAKE_BUILD_TYPE=Release && make && popd
popd
make -B
```

# Running
```
[ ! -f ./ggml-model-f32.gguf ] && wget https://huggingface.co/SDFASDGA/llm/resolve/main/ggml-model-f32.gguf
./llm -m ggml-model-f32.gguf -t 0.9 -v -n 96 -p "I stopped posting on knitting forums because"
```

# Building debug
```
pushd zfp && rm -rf build && mkdir build
pushd build && cmake .. -DBUILD_ZFORP=1 -DCMAKE_BUILD_TYPE=Debug && make && popd
popd
make -B OPT='-O0 -g'
```

# old readme
[here](org.readme.md)
