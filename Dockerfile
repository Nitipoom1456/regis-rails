# Stage 1: Build environment
FROM ruby:3.3.1-alpine AS builder

# Install build dependencies and other necessary packages
RUN apk update && apk add --no-cache \
    build-base \
    sqlite-dev \
    git \
    tzdata \
    libxml2-dev \
    libxslt-dev \
    gcompat

# Set up the working directory
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install the gems
RUN gem install bundler && \
    bundle config set --local build.nokogiri --use-system-libraries && \
    bundle install

# Copy the rest of the application code
COPY . .

# Stage 2: Runtime environment
FROM ruby:3.3.1-alpine

# Install runtime dependencies
RUN apk update && apk add --no-cache \
    sqlite-libs \
    tzdata \
    libxml2 \
    libxslt \
    gcompat

# Set up the working directory
WORKDIR /usr/src/app

# Copy the gems and application from the build stage
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /usr/src/app /usr/src/app

# Ensure that the `bundler` and `rails` binaries are available in PATH
ENV PATH /usr/local/bundle/bin:$PATH

# Set the timezone (optional)
ENV TZ=UTC

# Entrypoint prepares the database.
ENTRYPOINT ["/usr/src/app/bin/docker-entrypoint"]

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]