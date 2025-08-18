FROM basedevimage:bookworm

LABEL org.opencontainers.image.source=https://github.com/mkykadir/containarized

RUN curl -fsSL https://github.com/owenizedd/bum/raw/main/install.sh | bash && \
    echo 'export PATH="$PATH:/root/.bum/bin:/root/.bun/bin"' >> ~/.zshrc

ENTRYPOINT [ "/bin/zsh", "-l" ]
