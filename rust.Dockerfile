# From https://github.com/rust-lang/docker-rust/blob/master/stable/bookworm/Dockerfile

FROM basedevimage:bookworm

LABEL org.opencontainers.image.source=https://github.com/mkykadir/containarized

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENTRYPOINT [ "/bin/zsh", "-l" ]
