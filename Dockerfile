# Use the official Ruby image from the Docker Hub
FROM ruby:3.2.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock /app/

# Install the Ruby dependencies
RUN bundle install

# Copy the rest of the application code to the working directory
COPY . /app

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
