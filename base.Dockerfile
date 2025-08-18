# This is a Base image with Git, Zsh and Oh-My-Zsh installed
# git and auto-suggestions plugins are ready 
FROM buildpack-deps:bookworm

LABEL org.opencontainers.image.source=https://github.com/mkykadir/containarized

# Install dependencies
RUN apt-get update
RUN apt-get -y install openssh-client git curl zsh locales vim nano
RUN apt-get clean
RUN locale-gen tr_TR.UTF-8

WORKDIR /root

# Setup oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup ZSH plugins
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

COPY static/zshrc .zshrc

ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]
