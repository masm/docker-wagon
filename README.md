# docker-wagon

> A Wagon (LocomotiveCMS) image

## Install

Pull this image with `docker pull masm/wagon`.

## Usage

Running the images starts `wagon serve`.
You need to expose port 3333.
You also need to mount a volume with your website on `/app`.
Run it with something like:

  docker run --rm --expose 3333:3333 --volume `pwd`:/app masm/wagon

, or pass `wagon push` to push to the engine:

  docker run --rm --expose 3333:3333 --volume `pwd`:/app masm/wagon wagon push

To make sure that it works correctly, either copy my `Gemfile` and `Gemfile.lock` files to
your project's folder, or create an image based in this image, thus updating the gems inside
the container to be what your project expects. You can do that with the following Dockerfile
(assuming the Dockerfile is in your website's folder):

  FROM masm/wagon
  ADD Gemfile Gemfile
  ADD Gemfile.lock Gemfile.lock
  RUN bundle install

## License

Copyright (c) 2015 Marco Monteiro. Released under the MIT license. See `LICENSE` file for details.
