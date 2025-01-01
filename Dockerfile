# Create a Jekyll container from a Ruby Alpine image

FROM ruby:3.4.1-slim-bookworm

# Add Jekyll dependencies
RUN apt update
RUN apt install -y build-essential gcc cmake git

# setup app folder
WORKDIR /app
COPY . .

# install project dependency
RUN bundle install

# keep the container running
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--host", "0.0.0.0"]

