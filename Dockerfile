FROM ruby:slim

COPY app.rb /home/app.rb

RUN chmod +x /home/app.rb

ENTRYPOINT /home/app.rb