FROM debian:bullseye-20201012

COPY . /home/ccview

WORKDIR /home/ccview

RUN /bin/bash --login && \ 
      apt -o APT::Sandbox::User=root update -y && apt-get install -y build-essential autoconf \ 
      automake bison libssl-dev libyaml-dev libreadline6-dev zlib1g zlib1g-dev \ 
      libncurses5-dev ncurses-dev libffi-dev libgdbm-dev openssl libc6-dev libsqlite3-dev \ 
      libtool libxml2-dev libxslt-dev libxslt1-dev sqlite3 postgresql libpq-dev curl vim git dirmngr gnupg2 ruby-full && \
      gem install bundler && gem install pg -v '1.1.4' --source 'https://rubygems.org/' && bundler install && \
      gem install unicorn && bundle exec cap install
