FROM ubuntu:18.04 as builder

WORKDIR /build
ADD https://gitlab.com/gitlab-com/support/toolbox/strace-parser/uploads/d0dfb5069715dab14344c8e095066be5/strace-parser.tar .

RUN tar -xvof ./strace-parser.tar

FROM ubuntu:18.04
COPY --from=builder /build/strace-parser /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/strace-parser" ]
