FROM antora/antora:testing

# Install extensions globally within the container
RUN yarn global add \
  @asciidoctor/core \
  asciidoctor-kroki \
  @antora/lunr-extension

# Set up a secure working directory
WORKDIR /antora

# Ensure the antora user owns the workspace
RUN chown -R antora:antora /antora

USER antora

ENTRYPOINT ["antora"]