FROM antora/antora:testing AS infrafleet/antora:v0.0.1

# Install extensions globally within the container
RUN yarn global add \
  @asciidoctor/core \
  asciidoctor-kroki \
  @antora/lunr-extension

# Set up a secure working directory
WORKDIR /antora

# Step 1: Switch to root user
USER root

# Step 2: Ensure the directory exists and change ownership
RUN mkdir -p /antora

# Step 3: Create the antora group and user (Alpine Linux syntax)
RUN addgroup -S antora && adduser -S antora -G antora

# Step 4: Ensure the antora user owns the workspace
RUN chown -R antora:antora /antora

# Step 5: USER antora
USER antora

ENTRYPOINT ["antora"]