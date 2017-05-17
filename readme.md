# Using ProtoBufs in Swift

Demo project that accompanies the raywenderlich.com screencast.


## Using docker

The requirements are all in the form of a docker container.

To build:

```sh
$ docker build .
```

To use the prebuilt version:

```sh
$ docker run -p 127.0.0.1:5000:5000 -it -v $PWD:/opt/protobuf raywenderlich/sc_protobufs
```

Create the protobuf output:

```sh
$ cd ProtoSchema
$ protoc --swift_out=. contact.proto
$ protoc -I=. --python_out=. ./contact.proto
```

Run the python server:

```sh
$ cd Server
$ python RWServer.py
```



