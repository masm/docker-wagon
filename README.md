# docker-wagon

> A Wagon (LocomotiveCMS) image

## Install

Pull this image with `docker pull masm/wagon`.

## Usage

This image is built to have gems bundled into a docker volume.

First, create a container for using as a volume for bundler data:
```
docker create --name wagon-bundle --volume /bundle busybox
```

Then run `bundle install` (gems are stored in the volume):
```
docker run --rm --volume `pwd`:/app --volumes-from wagon-bundle \
       --entrypoint bundle masm/wagon install
```

Finally, serve your wagon site with:
```
docker run --rm --publish 3333:3333 --volume `pwd`:/app --volumes-from wagon-bundle masm/wagon
```

This starts `wagon serve`.  Your site should be available in `localhost:3333`.

Or pass `wagon push` to push your website:

```
docker run --rm --volume `pwd`:/app --volume-from wagon-bundle masm/wagon wagon push
```

## License

Copyright (c) 2015 Marco Monteiro. Released under the MIT license. See `LICENSE` file for details.
