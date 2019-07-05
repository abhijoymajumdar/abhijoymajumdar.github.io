FROM jekyll/jekyll

COPY --chown=jekyll:jekyll Gemfile .
COPY --chown=jekyll:jekyll Gemfile.lock .

RUN chown -R jekyll: . && bundle install --clean

CMD ["jekyll", "serve"]